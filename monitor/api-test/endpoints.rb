require 'json'
require 'net/http'
require 'rspec'
require 'uri'

API_URI = 'http://api:/api'

APP_KEYS = [
  'name',
  'db',
  'api',
  'frontend',
  'webserver',
  'os',
  'role',
  'description'
]

PROJECT_KEYS = [
  'name',
  'description',
  'role',
  'organization'
]

SKILL_BY_TYPE_KEYS = [
  'name',
  'skills'
]

SKILL_KEYS = [
  'type',
  'name',
  'detail',
  'featured',
  'rank_in_type'
]

SKILL_TYPE_KEYS = [
  'name'
]

TITLE_KEYS = [
  'title',
  'internal_title',
  'company'
]

EDUCATION_KEYS = [
  'institution',
  'degree',
  'field',
  'honors'
]

FOUR_O_FOUR_KEYS = [
  'message',
  'error',
  'statusCode'
]

def list_response_test(uri, keys)
  res = Net::HTTP.get_response(uri)
  body = res.body
  data = JSON.parse(body)
  all_match = data.all? do |hash|
    if hash.keys.sort() != keys.sort() then
      puts ''
      puts 'response keys:'
      puts hash.keys.sort()
      puts ''
      puts 'expected keys:'
      puts keys.sort()
    else
      true
    end
  end
  expect(all_match).to eq(true)
end

def show_response_test(uri, keys)
  res = Net::HTTP.get_response(uri)
  body = res.body
  data = JSON.parse(body)
  expect(data.keys.sort()).to eq(keys.sort())
end

def show_404_response_test(uri, keys)
  res = Net::HTTP.get_response(uri)
  body = res.body
  data = JSON.parse(body)
  expect(data.keys.sort()).to eq(FOUR_O_FOUR_KEYS.sort())
end

describe 'API' do
  it 'Returns a list of apps (postgres)' do
    uri = URI("#{API_URI}/pg/apps")
    list_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of from apps (mysql)' do
    uri = URI("#{API_URI}/mysql/apps")
    list_response_test(uri, APP_KEYS)
  end

  it 'Returns a single app' do
    uri = URI("#{API_URI}/pg/apps/FullSend")
    show_response_test(uri, APP_KEYS)
  end

  it 'Returns 404 on non-existent app' do
    uri = URI("#{API_URI}/pg/apps/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of projects (postgres)' do
    uri = URI("#{API_URI}/pg/projects")
    list_response_test(uri, PROJECT_KEYS)
  end

  it 'Returns a list of projects (mysql)' do
    uri = URI("#{API_URI}/mysql/projects")
    list_response_test(uri, PROJECT_KEYS)
  end

  it 'Returns a single project' do
    uri = URI("#{API_URI}/pg/projects/Solutran")
    show_response_test(uri, PROJECT_KEYS)
  end

  it 'Returns 404 on non-existent project' do
    uri = URI("#{API_URI}/pg/projects/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of  grouped by type (postgres)' do
    uri = URI("#{API_URI}/pg/skills")
    list_response_test(uri, SKILL_BY_TYPE_KEYS)
  end

  it 'Returns a list of skills grouped by type (mysql)' do
    uri = URI("#{API_URI}/mysql/skills")
    list_response_test(uri, SKILL_BY_TYPE_KEYS)
  end

  it 'Returns a single skill' do
    uri = URI("#{API_URI}/pg/skills/Firewall")
    show_response_test(uri, SKILL_KEYS)
  end

  it 'Returns 404 on non-existent skill' do
    uri = URI("#{API_URI}/pg/skills/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of skill_types (postgres)' do
    uri = URI("#{API_URI}/pg/skill-types")
    list_response_test(uri, SKILL_TYPE_KEYS)
  end

  it 'Returns a list of skill_types (mysql)' do
    uri = URI("#{API_URI}/mysql/skill-types")
    list_response_test(uri, SKILL_TYPE_KEYS)
  end

  it 'Returns a single skill_type' do
    uri = URI("#{API_URI}/pg/skill-types/Database")
    show_response_test(uri, SKILL_TYPE_KEYS)
  end

  it 'Returns 404 on non-existent skill_type' do
    uri = URI("#{API_URI}/pg/skill-types/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of titles (postgres)' do
    uri = URI("#{API_URI}/pg/titles")
    list_response_test(uri, TITLE_KEYS)
  end

  it 'Returns a list of titles (mysql)' do
    uri = URI("#{API_URI}/mysql/titles")
    list_response_test(uri, TITLE_KEYS)
  end

  it 'Returns a single title' do
    uri = URI("#{API_URI}/pg/titles/Senior%20Developer_CVS%20Health")
    show_response_test(uri, TITLE_KEYS)
  end

  it 'Returns 404 on non-existent title' do
    uri = URI("#{API_URI}/pg/title/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of education (postgres)' do
    uri = URI("#{API_URI}/pg/education")
    list_response_test(uri, EDUCATION_KEYS)
  end

  it 'Returns a list of education (mysql)' do
    uri = URI("#{API_URI}/mysql/education")
    list_response_test(uri, EDUCATION_KEYS)
  end

  it 'Returns a single education' do
    uri = URI("#{API_URI}/pg/education/Launch%20Academy")
    show_response_test(uri, EDUCATION_KEYS)
  end

  it 'Returns 404 on non-existent education' do
    uri = URI("#{API_URI}/pg/education/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end
end
