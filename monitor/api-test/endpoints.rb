require 'json'
require 'net/http'
require 'rspec'
require 'uri'

API_URI = 'https://brian86.dev/api/pg'

def get_response_test(uri, keys)
  res = Net::HTTP.get_response(uri)
  body = res.body
  data = JSON.parse(body)
  all_match = data.all? do |hash|
    hash.keys.sort() == keys.sort()
  end
  expect(all_match).to eq(true)
end

describe 'API' do
  it 'Returns a list of apps' do
    keys = [
      'name',
      'database',
      'api',
      'frontend',
      'webserver',
      'os',
      'role',
      'description'
    ]
    uri = URI("#{API_URI}/apps")
    get_response_test(uri, keys)
  end

  it 'Returns a list of projects' do
    keys = [
      'name',
      'description',
      'role',
      'organization'
    ]
    uri = URI("#{API_URI}/projects")
    get_response_test(uri, keys)
  end

  it 'Returns a list of skills' do
    keys = ['type', 'name']
    uri = URI("#{API_URI}/skills")
    get_response_test(uri, keys)
  end

  it 'Returns a list of skill_types' do
    keys = ['name']
    uri = URI("#{API_URI}/skill-types")
    get_response_test(uri, keys)
  end

  it 'Returns a list of titles' do
    keys = ['title', 'internal_title', 'company']
    uri = URI("#{API_URI}/titles")
    get_response_test(uri, keys)
  end

  it 'Returns a list of education' do
    keys = ['institution', 'degree', 'field', 'honors']
    uri = URI("#{API_URI}/education")
    get_response_test(uri, keys)
  end
end
