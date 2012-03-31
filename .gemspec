# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/tendril/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-tendril'
  s.version       = OmniAuth::Facebook::VERSION
  s.authors       = ['Matt Solt']
  s.email         = ['mattsolt@gmail.com']
  s.summary       = 'Tendril strategy for OmniAuth'
  s.description   = 'Tendril strategy for OmniAuth'
  s.homepage      = 'https://github.com/activefx/omniauth-tendril'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0.0'

  s.add_development_dependency 'rspec', '~> 2.9.0'
  s.add_development_dependency 'rake'
end

