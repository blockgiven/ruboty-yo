RSpec.shared_context 'yo ok', :yo_ok do
  around do |example|
    VCR.use_cassette('yo_ok') do
      example.run
    end
  end
end
