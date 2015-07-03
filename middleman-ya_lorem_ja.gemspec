# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-ya_lorem_ja/version"

Gem::Specification.new do |s|
  s.name        = "middleman-ya_lorem_ja"
  s.version     =  Middleman::YaLoremJa::VERSION
  s.platform    = Gem::Platform::RUBY
  # s.authors     = ["Your Name"]
  # s.email       = ["email@example.com"]
  # s.homepage    = "http://example.com"
  s.summary     = %q{Yet Another Japanese Lorem Ipsum generator For Middleman}
  # s.description = %q{A longer description of your extension}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.3.12"])
  
  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
