require_relative 'helpers/get_uncategorized_ips'
require_relative 'helpers/get_requests_by_ip'

def log_uncategorized_requests
  get_uncategorized_ips().each { |ip| puts get_requests_by_ip(ip) }
end

log_uncategorized_requests()
