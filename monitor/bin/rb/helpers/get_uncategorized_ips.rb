require_relative 'db'

def get_uncategorized_ips
  sql = <<-SQL
    SELECT DISTINCT
      ip
    FROM
      ip
    WHERE
      data_attempt IS NULL
      AND benign IS NULL
      AND consumer IS NULL
      AND crawler IS NULL
      AND suspicious IS NULL;
  SQL
  db.exec(sql).map { |row| row['ip'] }
end
