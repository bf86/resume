require 'pg'

# Sets up a DB connection

puts 'connecting to:'
puts "host: #{ENV['POSTGRES_HOST_PRODUCTION']}"
puts "dbname: #{ENV['POSTGRES_DB_NAME_PRODUCTION']}"

puts 'ok? (y/n)'
ok = gets.chomp == 'y'
if !ok then exit 1 end

def db
  return PG.connect(
    host: ENV['POSTGRES_HOST_PRODUCTION'],
    dbname: ENV['POSTGRES_DB_NAME_PRODUCTION'],
    user: ENV['POSTGRES_USER_PRODUCTION'],
    password: ENV['POSTGRES_PASSWORD_PRODUCTION']
  )
end
