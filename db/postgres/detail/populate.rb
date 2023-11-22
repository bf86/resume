# Ensure that every skill in $RESUME_PATH/db/csv/skill/skill.csv has a detail file

def populate
  def assert_detail_file(skill)
    command = "touch $RESUME_PATH/db/detail/skill/#{skill}.md || true"
    puts command
    # puts 'ok? (y/n)'
    # ok = gets.chomp == 'y'
    # if !ok then return end
    system command
  end

  File.open("#{ENV['RESUME_PATH']}/db/csv/skill/skill.csv").each do |line|
    skill = line.split('|')[0].downcase.gsub(' ', '-').gsub('/', '-')
    assert_detail_file(skill)
  end
end

populate()
