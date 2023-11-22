require 'pg'

# Sets up a DB connection

puts 'connecting to:'
puts "host: #{ENV['POSTGRES_HOST']}"
puts "dbname: #{ENV['POSTGRES_DB_NAME']}"

# puts 'ok? (y/n)'
# ok = gets.chomp == 'y'
# if !ok then exit 1 end

def db
  return PG.connect(
    host: ENV['POSTGRES_HOST'],
    dbname: ENV['POSTGRES_DB_NAME'],
    user: ENV['POSTGRES_USER'],
    password: ENV['POSTGRES_PASSWORD']
  )
end
