# Returns an array of IPs that have been blocked by the no-hackers rule

def get_blocked_hacker_ips
  command = "gcloud compute --project=#{ENV['RESUME_PROJECT_ID']} firewall-rules describe no-hackers"
  result = `#{command}`
  lines = result.split("\n")
  hacker_ips = []
  lines.each do |line|
    if line.match(/- \d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/) then
      hacker_ips.push(line.split('- ')[1].split('/32')[0])
    end
  end
  return hacker_ips.uniq()
end
