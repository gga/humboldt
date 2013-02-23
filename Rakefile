require 'rspec/core/rake_task'
require 'cucumber/rake/task'

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList['spec/*_spec.rb']
  t.rspec_opts = "--color"
end

desc "Run all features"
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end

desc "Runs all tests"
task :test => [:spec, :features]
