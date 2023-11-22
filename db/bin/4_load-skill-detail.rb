require 'pg'

def db
  return PG.connect(
    host: ENV['POSTGRES_HOST'],
    dbname: ENV['POSTGRES_DB_NAME'],
    user: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD']
  )
end

def load_detail(skill)
  file_name = skill.downcase.gsub(' ', '-').gsub('/', '-')
  file_path = "#{ENV['RESUME_PATH']}/db/detail/skill/#{file_name}.md"
  return unless File.exist?(file_path)
  text = File.read(file_path).chomp
  return unless text.length && text.match(/\w/)
  sql = 'UPDATE skill SET detail = $1 WHERE name = $2'
  result = db.exec(sql, [text, skill])
  puts skill
  puts text
  puts result.to_a
end

sql = 'SELECT name FROM skill'
result = db.exec(sql).map { |row| row['name'] }
result.each { |skill| load_detail(skill) }
