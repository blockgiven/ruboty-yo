require 'vcr'
require 'webmock/rspec'

WebMock.allow_net_connect!
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
end
