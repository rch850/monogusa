# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "monogusa/version"

Gem::Specification.new do |s|
  s.name        = "monogusa"
  s.version     = Monogusa::VERSION
  s.authors     = ["rch850"]
  s.email       = ["rich850@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{AWS Resource Viewer for Monogusa.}
  s.description = %q{AWS Resource Viewer for Monogusa.}

  s.rubyforge_project = "monogusa"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "sinatra"
  s.add_runtime_dependency "aws-sdk"
  s.add_runtime_dependency "slim"
end
