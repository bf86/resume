#!/usr/bin/env ruby

require_relative 'helpers/db_production'
require_relative 'helpers/get_blocked_hacker_ips'

# Firewall reject all IPs that have been flagged as data attempt

def block_hackers()
  get_hackers_sql = "SELECT ip FROM ip WHERE hacker = TRUE AND ip != '#{ENV['MY_IP']}'";
  db.exec(get_hackers_sql) do |result|
    hacker_ips = result.map { |row| row['ip'] }
    blocked_hacker_ips = get_blocked_hacker_ips()
    all_ips_to_block = hacker_ips.concat(blocked_hacker_ips).uniq()
    ranges_to_block = all_ips_to_block.map { |ip| "#{ip}/32" }
    reject_string = ranges_to_block.sort().join(',')
    block_command = "gcloud compute --project=#{ENV['RESUME_PROJECT_ID']} "
    block_command += 'firewall-rules update no-hackers '
    block_command += "--source-ranges=#{reject_string}"
    puts block_command
    result = `#{block_command}`
    print result
    describe_command = "gcloud compute --project=#{ENV['RESUME_PROJECT_ID']} "
    describe_command += 'firewall-rules describe no-hackers'
    puts describe_command
    result = `#{describe_command}`
    puts result
    puts 'cya'
  end
end

block_hackers()
