require 'pg'

def db
  return PG.connect(
    host: ENV['POSTGRES_HOST'],
    dbname: ENV['POSTGRES_DB'],
    user: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD']
  )
end

def load_answer(key)
  file_name = key.upcase()
  file_path = "#{ENV['RESUME_PATH']}/db/detail/faq/#{file_name}.md"
  return unless File.exist?(file_path)
  text = File.read(file_path).chomp
  return unless text.length && text.match(/\w/)
  sql = 'UPDATE faq SET answer = $1 WHERE key = $2'
  result = db.exec(sql, [text, key])
  puts key
  puts text
  puts result.to_a
end

sql = 'SELECT key FROM faq'
result = db.exec(sql).map { |row| row['key'] }
result.each { |key| load_answer(key) }
