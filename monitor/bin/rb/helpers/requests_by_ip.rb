# Returns an array of all requests from an ip

def requests_by_ip(ip)
  ip_lines = []
  File.open("#{ENV['NGINX_LOG_PATH']}/access.log").each do |line|
    if line.match(ip) then ip_lines.push(line) end
  end
  ip_lines
end
