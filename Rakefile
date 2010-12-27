require 'rspec/core/rake_task'
require 'cucumber/rake/task'

SPECS = FileList['spec/*_spec.rb']

desc "Run all specs"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = SPECS
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end