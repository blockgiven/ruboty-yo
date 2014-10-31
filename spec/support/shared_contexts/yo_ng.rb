RSpec.shared_context 'yo ng', :yo_ng do
  around do |example|
    VCR.use_cassette('yo_ng') do
      example.run
    end
  end
end
