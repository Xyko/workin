lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "workin/version"

Gem::Specification.new do |spec|

  spec.name          = "workin"
  spec.version       = Workin::VERSION
  spec.authors       = ["Xyko"]
  spec.email         = ["xykoglobo@gmail.com.br"]
  spec.summary       = %q{Command line to change your workdir quickly.}
  spec.description   = %q{Helpper to transfer the rvm control to current selected workdir.}
  spec.homepage      = Workin::HOMEPAGE
  spec.license       = "MIT"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.files         = %x(git ls-files).split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.metadata['allowed_push_host'] = "https://rubygems.org"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.10", '>= 5.10.2'

  spec.add_runtime_dependency 'awesome_print'
  spec.add_runtime_dependency 'colorize'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'prompt'

end
