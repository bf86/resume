#!/usr/bin/env ruby

require_relative 'helpers/get_uncategorized_ips'
require_relative 'helpers/get_requests_by_ip'
require_relative 'helpers/db'

# 1. Gets a list of IPs that have not been assessed yet and their requests
# 2. Presents to user with prompts to categorize (benign / suspicious / data attempt)
# 3. Updates DB accordingly

def ip_assess
  ips = get_uncategorized_ips()
  ips.each_with_index do |ip, i|
    # if !ip.match(/\d+/) then next end
    puts ''
    puts "~#{ips.length - i} ips left to assess"
    puts ip
    puts get_requests_by_ip(ip)
    puts 'do any of these requests appear benign?'
    benign = gets.chomp == 'y' ? true : nil
    puts 'do any of these requests appear suspicious?'
    suspicious = gets.chomp == 'y' ? true : nil
    puts 'do any of these requests appear to be data attempts?'
    hacker = gets.chomp == 'y' ? true : nil
    update_ip_sql = <<-SQL
      UPDATE ip SET benign = $1, suspicious = $2, hacker = $3 WHERE ip = $4;
SQL
    db.exec(update_ip_sql, [benign, suspicious, hacker, ip])
  end
end

ip_assess()
puts 'cya'
