#!/usr/bin/env ruby

require_relative 'helpers/requests_by_ip'
require_relative 'helpers/db'

# 1. Gets a list of IPs that have not been assessed yet and their requests
# 2. Presents to user with prompts to categorize (benign / suspicious / data theft attempt)
# 3. Updates DB accordingly

def ip_assess
  get_new_ips_sql = <<-SQL
    SELECT
      ip
    FROM
      ip
    WHERE
      data_attempt IS NULL
      AND benign IS NULL
      AND suspicious IS NULL;
SQL
  db.exec(get_new_ips_sql) do |ip_result|
    ips = ip_result.map { |row| row['ip'] }
    ips.each do |ip|
      if !ip.match(/\d+/) then next end
      puts ''
      puts "~#{ips.length} ips left to assess"
      puts ip
      puts requests_by_ip(ip)
      puts 'do any of these requests appear benign?'
      benign = gets.chomp == 'y' ? true : nil
      puts 'do any of these requests appear suspicious?'
      suspicious = gets.chomp == 'y' ? true : nil
      puts 'do any of these requests appear to be data attempts?'
      data_attempt = gets.chomp == 'y' ? true : nil
      update_ip_sql = <<-SQL
        UPDATE ip SET benign = $1, suspicious = $2, data_attempt = $3 WHERE ip = $4;
SQL
      db.exec(update_ip_sql, [benign, suspicious, data_attempt, ip])
    end
  end
end

ip_assess()
puts 'cya'
