# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'humboldt/version'

Gem::Specification.new do |gem|
  gem.name          = "humboldt"
  gem.version       = Humboldt::VERSION
  gem.authors       = ["Giles Alexander"]
  gem.email         = ["gga@overwatering.org"]
  gem.description   = %q{Distributed benchmarking and performance testing.}
  gem.summary       = %q{Distributed benchmarking and performance testing.}
  gem.homepage      = "http://github.com/gga/humboldt"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "cucumber"
end
