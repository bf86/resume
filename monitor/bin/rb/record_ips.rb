#!/usr/bin/env ruby

require_relative './helpers/db'
require_relative './helpers/get_benign_defs'
require_relative './helpers/get_consumer_defs'
require_relative './helpers/get_data_attempt_defs'

# Record all IPs that have requested from server
# Yes, there are existing tools to do this better
# But it seemed like a worthwhile exercise to create my own

def record_ips()
  # Vars
  @ip_count = 0
  @benign_count = 0
  @consumer_count = 0
  @data_attempt_count = 0

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

    @ip_count += 1

    benign = get_benign_defs().any? { |benign_def| line.match(benign_def) } || nil
    consumer = get_consumer_defs().any? { |consumer_def| line.match(consumer_def) } || nil
    data_attempt = get_data_attempt_defs().any? { |attempt_def| line.match(attempt_def) } || nil

    @benign_count += 1 if benign
    @consumer_count += 1 if consumer
    @data_attempt_count += 1 if data_attempt

    record_ip_sql = <<-SQL
      INSERT INTO
        ip (ip, benign, consumer, data_attempt)
      VALUES
        ($1, $2, $3, $4)
      ON CONFLICT
        (ip)
      DO UPDATE SET
        benign = ($2 OR ip.benign),
        consumer = ($3 OR ip.consumer),
        data_attempt = ($4 OR ip.data_attempt);
SQL

    db.exec(record_ip_sql, [ip, benign, consumer, data_attempt])
  end

  File.open("#{ENV['NGINX_LOG_PATH']}/access.log").each do |line|
    record_line(line)
  end

  puts "recorded or updated #{@ip_count} IPs"
  puts "#{@benign_count} made requests marked benign"
  puts "#{@consumer_count} made requests marked consumer"
  puts "#{@data_attempt_count} made requests flagged data_attempt"
end

record_ips()
puts 'cya'
