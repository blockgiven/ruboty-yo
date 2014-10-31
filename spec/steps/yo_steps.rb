step 'テスト用のRubotyがいる' do
  @ruboty = ::Ruboty::Robot.new
  @ruboty.run
end

step ':nameはyoを使っている' do |name|
  @yo_users ||= []
  @yo_users << name
end

step ':nameはyoを使うのをやめた' do |name|
  @yo_users -= [name]
end

step ':bodyと私が言った' do |body|
  @ruboty.receive(body: body)
end

step 'Rubotyは:nameにyoと伝えた' do |name|
  expect(@yo_users).to include name
  expect(WebMock).to have_requested(:post, 'https://api.justyo.co/yo/').with {|req| req.body.include? "username=#{name}" }
end

step 'Rubotyは:nameにyoと伝えられなかった' do |name|
  expect(@yo_users).not_to include name
  expect(WebMock).to have_requested(:post, 'https://api.justyo.co/yo/').with {|req| req.body.include? "username=#{name}" }
end

step 'Rubotyは:bodyと言った' do |body|
  expect(@ruboty).to be_said body
end
