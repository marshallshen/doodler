# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doodler/version'

Gem::Specification.new do |gem|
  gem.name          = "doodler"
  gem.version       = Doodler::VERSION
  gem.authors       = ["Marshall Shen"]
  gem.email         = ["mshen@groupon.com"]
  gem.description   = "Ruby image processing package using ChunkyPNG"
  gem.summary       = "Ruby image processing package using ChunkyPNG"
  gem.homepage      = "https://github.com/marshallshen/doodler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency "chunky_png"
  gem.require_paths = ["lib"]
end
