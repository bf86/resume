require 'json'
require 'net/http'
require 'rspec'
require 'uri'

API_URI = 'http://api:/api/pg'

APP_KEYS = [
  'name',
  'database',
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
    hash.keys.sort() == keys.sort()
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
  it 'Returns a list of apps' do
    uri = URI("#{API_URI}/apps")
    list_response_test(uri, APP_KEYS)
  end

  it 'Returns a single app' do
    uri = URI("#{API_URI}/apps/FullSend")
    show_response_test(uri, APP_KEYS)
  end

  it 'Returns 404 on non-existent app' do
    uri = URI("#{API_URI}/apps/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of projects' do
    uri = URI("#{API_URI}/projects")
    list_response_test(uri, PROJECT_KEYS)
  end

  it 'Returns a single project' do
    uri = URI("#{API_URI}/projects/Solutran")
    show_response_test(uri, PROJECT_KEYS)
  end

  it 'Returns 404 on non-existent project' do
    uri = URI("#{API_URI}/projects/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of skills' do
    uri = URI("#{API_URI}/skills")
    list_response_test(uri, SKILL_KEYS)
  end

  it 'Returns a single skill' do
    uri = URI("#{API_URI}/skills/Firewall")
    show_response_test(uri, SKILL_KEYS)
  end

  it 'Returns 404 on non-existent skill' do
    uri = URI("#{API_URI}/skills/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of skill_types' do
    uri = URI("#{API_URI}/skill-types")
    list_response_test(uri, SKILL_TYPE_KEYS)
  end

  it 'Returns a single skill_type' do
    uri = URI("#{API_URI}/skill-types/Database")
    show_response_test(uri, SKILL_TYPE_KEYS)
  end

  it 'Returns 404 on non-existent skill_type' do
    uri = URI("#{API_URI}/skill-types/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of titles' do
    uri = URI("#{API_URI}/titles")
    list_response_test(uri, TITLE_KEYS)
  end

  it 'Returns a single title' do
    uri = URI("#{API_URI}/titles/Senior%20Developer_CVS%20Health")
    show_response_test(uri, TITLE_KEYS)
  end

  it 'Returns 404 on non-existent title' do
    uri = URI("#{API_URI}/title/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end

  it 'Returns a list of education' do
    uri = URI("#{API_URI}/education")
    list_response_test(uri, EDUCATION_KEYS)
  end

  it 'Returns a single education' do
    uri = URI("#{API_URI}/education/Launch%20Academy")
    show_response_test(uri, EDUCATION_KEYS)
  end

  it 'Returns 404 on non-existent education' do
    uri = URI("#{API_URI}/education/hornswoggle")
    show_404_response_test(uri, APP_KEYS)
  end
end
