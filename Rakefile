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
