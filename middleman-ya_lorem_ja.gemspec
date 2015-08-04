# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-ya_lorem_ja/version"

Gem::Specification.new do |s|
  s.name        = "middleman-ya_lorem_ja"
  s.version     =  Middleman::YaLoremJa::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["kenji tanaka"]
  s.homepage    = "https://github.com/tanalab2/middleman-ya_lorem_ja"
  s.summary     = %q{Yet Another Japanese Lorem Ipsum generator For Middleman}
  s.description = %q{Yet Another Japanese Lorem Ipsum generator For Middleman}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.3.12"])
  
  # Additional dependencies
  s.add_runtime_dependency("ya_lorem_ja", ">= 0.0.1")
end
