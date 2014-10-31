require "bundler/gem_tasks"
begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |c|
    c.pattern = [*c.pattern, 'spec/**{,/*/**}/*.feature']
    c.rspec_opts = [*c.rspec_opts, '-r turnip/rspec']
  end
  task default: :spec
rescue LoadError
end

desc 'make test yo data'
task :test_yo do
  require 'net/http'
  require 'securerandom'
  require 'vcr'
  require 'webmock'

  WebMock.allow_net_connect!
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/fixtures'
    c.hook_into :webmock
  end

  yo_endpoint_url = URI.parse('https://api.justyo.co/yo/')

  exists_username  = 'JOE'
  missing_username = SecureRandom.uuid.gsub(/-/, '')

  VCR.use_cassette('yo_ok') do
    params = {api_token: ENV['YO_API_TOKEN'], username: exists_username}
    p Net::HTTP.post_form(yo_endpoint_url, params)
  end
  VCR.use_cassette('yo_ng') do
    params = {api_token: ENV['YO_API_TOKEN'], username: missing_username}
    p Net::HTTP.post_form(yo_endpoint_url, params)
  end

  %w(ok ng).each do |status|
    yo_filename = "spec/fixtures/yo_#{status}.yml"
    yo = File.read(yo_filename)

    fake_api_token = SecureRandom.uuid
    yo.gsub!(ENV['YO_API_TOKEN'], fake_api_token)
    yo.gsub!(exists_username, 'johndoe')
    yo.gsub!(missing_username, 'janedoe')

    File.write(yo_filename, yo)
  end
end
