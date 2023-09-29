#!/usr/bin/env ruby

require_relative './helpers/db'

# Record all IPs that have requested from server
# Yes, there are existing tools to do this better
# But it seemed like a worthwhile exercise to create my own

def record_ips()
  def record_line(line)
    if !line then
      return;
    end
    segment_one = line.split(' - ')[0];
    if !segment_one then
      return;
    end
    ip = segment_one.match(/\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)
    if !ip then
      return;
    end
    data_attempt = line.match(/\.env/) || line.match(/XDEBUG_SESSION_START/) ? true : nil;
    puts ip
    record_ip_sql = <<-SQL
      INSERT INTO
        ip (ip, data_attempt)
      VALUES
        ($1, $2)
      ON CONFLICT
        (ip)
      DO UPDATE SET
        data_attempt = ($2 OR ip.data_attempt);
SQL
    db.exec(record_ip_sql, [ip, data_attempt])
  end

  File.open("#{ENV['NGINX_LOG_PATH']}/access.log").each do |line|
    record_line(line)
  end
end

record_ips()
puts 'cya'
