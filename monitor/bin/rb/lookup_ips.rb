require_relative 'helpers/db'
# require_relative 'helpers/whois'

# Get whois info about all ips and add to database
# This is useless since the organisation isn't really a useful field
# Oh well, interesting exercise I guess
# Maybe could automate reporting with the abuse fields idk

def lookup_ips()
  unknown_ips_sql = 'SELECT * FROM ip WHERE organization IS NULL'
  unknown_ips = db.exec(unknown_ips_sql).map { |row| row['ip'] }
  unknown_ips.each do |ip|
    puts ip
    if !ip then next end
    ip_info = `whois #{ip}`
    whois_rows = ip_info.scrub().split("\n").compact()
    whois_rows.any? do |row|
      if row[0..13] == 'organisation: ' then
        org = row.split('organisation: ')[1]
        update_org_sql = 'UPDATE ip SET organization = $1 WHERE ip = $2'
        db.exec(update_org_sql, [org, ip])
        break
      end
    end
  end
  puts 'all done!'
end

lookup_ips()
