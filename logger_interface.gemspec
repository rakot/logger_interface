# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logger_interface/version'

Gem::Specification.new do |spec|
  spec.name          = "logger_interface"
  spec.version       = LoggerInterface::VERSION
  spec.authors       = ["Sergey Vardanyan"]
  spec.email         = ["rakot.ss@gmail.com"]
  spec.description   = %q{Interface for Logapper application}
  spec.summary       = %q{Interface for Logapper application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
