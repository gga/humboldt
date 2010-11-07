require 'rspec/core/rake_task'

SPECS = FileList['spec/*_spec.rb']

desc "Run all specs"
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = SPECS
end
