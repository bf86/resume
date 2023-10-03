#!/usr/bin/env ruby

require_relative 'helpers/db'
require_relative 'helpers/get_req_defs'

# Record all IPs that have requested from server
# Yes, there are existing tools to do this better
# But it seemed like a worthwhile exercise to create my own

def record_ips()
  # Vars
  @ips = {}
  @categorized_ips = {}
  @benign_ips = {}
  @crawler_ips = {}
  @consumer_ips = {}
  @hacker_ips = {}

  def record_line(line)
    if !line
      return end

    segment_one = line.split(' - ')[0];

    if !segment_one
      return end

    ip = segment_one.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)

    if !ip
      return end

    # puts ip

    @ips[ip] ||= true

    benign = get_benign_defs().any? { |benign_def| line.match(benign_def) } || nil
    consumer = get_consumer_defs().any? { |consumer_def| line.match(consumer_def) } || nil
    crawler = get_crawler_defs().any? { |crawler_def| line.match(crawler_def) } || nil
    hacker = get_hacker_defs().any? { |attempt_def| line.match(attempt_def) } || nil

    @benign_ips[ip] = true if benign
    @consumer_ips[ip] = true if consumer
    @crawler_ips[ip] = true if crawler
    @hacker_ips[ip] = true if hacker
    @categorized_ips[ip] = true if benign || consumer || crawler || hacker

    record_ip_sql = <<-SQL
      INSERT INTO
        ip (ip, benign, consumer, crawler, hacker)
      VALUES
        ($1, $2, $3, $4, $5)
      ON CONFLICT
        (ip)
      DO UPDATE SET
        benign = ($2 OR ip.benign),
        consumer = ($3 OR ip.consumer),
        crawler = ($4 OR ip.crawler),
        hacker = ($5 OR ip.hacker);
SQL

    db.exec(record_ip_sql, [ip, benign, consumer, crawler, hacker])
  end

  File.open("#{ENV['NGINX_LOG_PATH']}/access.log").each do |line|
    record_line(line)
  end

  puts "recorded or updated #{@ips.length} IPs"
  puts "#{@benign_ips.length} made requests marked benign"
  puts "#{@consumer_ips.length} made requests marked consumer"
  puts "#{@crawler_ips.length} made requests marked crawler"
  puts "#{@hacker_ips.length} made requests flagged hacker"
  puts "#{@ips.length - @categorized_ips.length} were not categorized"
end

record_ips()
puts 'cya'
