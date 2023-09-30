require 'json'
require 'net/http'
require 'rspec'
require 'uri'

API_URI = 'https://brian86.dev/api/pg/apps'

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
    uri = URI(API_URI)
    res = Net::HTTP.get_response(uri)
    body = res.body
    data = JSON.parse(body)
    all_match = data.all? do |hash|
      hash.keys.sort() == keys.sort()
    end
    expect(all_match).to eq(true)
  end

  it 'Returns a list of projects' do
    keys = [
      'name',
      'description',
      'role',
      'organization'
    ]
    uri = URI('https://brian86.dev/api/pg/projects')
    res = Net::HTTP.get_response(uri)
    body = res.body
    data = JSON.parse(body)
    all_match = data.all? do |hash|
      hash.keys.sort() == keys.sort()
    end
    expect(all_match).to eq(true)
  end

  it 'Returns a list of skills' do
    keys = ['type', 'name']
    uri = URI('https://brian86.dev/api/pg/skills')
    res = Net::HTTP.get_response(uri)
    body = res.body
    data = JSON.parse(body)
    all_match = data.all? do |hash|
      hash.keys.sort() == keys.sort()
    end
    expect(all_match).to eq(true)
  end

  it 'Returns a list of skill_types' do
    keys = ['name']
    uri = URI('https://brian86.dev/api/pg/skill-types')
    res = Net::HTTP.get_response(uri)
    body = res.body
    data = JSON.parse(body)
    all_match = data.all? do |hash|
      hash.keys.sort() == keys.sort()
    end
    expect(all_match).to eq(true)
  end

  it 'Returns a list of titles' do
    keys = ['title', 'internal_title', 'company']
    uri = URI('https://brian86.dev/api/pg/titles')
    res = Net::HTTP.get_response(uri)
    body = res.body
    data = JSON.parse(body)
    all_match = data.all? do |hash|
      hash.keys.sort() == keys.sort()
    end
    expect(all_match).to eq(true)
  end

  it 'Returns a list of education' do
    keys = ['institution', 'degree', 'field', 'honors']
    uri = URI('https://brian86.dev/api/pg/education')
    res = Net::HTTP.get_response(uri)
    body = res.body
    data = JSON.parse(body)
    all_match = data.all? do |hash|
      hash.keys.sort() == keys.sort()
    end
    expect(all_match).to eq(true)
  end
end
