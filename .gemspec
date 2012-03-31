# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/tendril/version'

Gem::Specification.new do |s|
  s.name          = 'omniauth-tendril'
  s.version       = OmniAuth::Tendril::VERSION
  s.authors       = ['Matt Solt']
  s.email         = ['mattsolt@gmail.com']
  s.summary       = 'Tendril OAuth2 strategy for OmniAuth'
  s.description   = %q{ Tendril OAuth2 strategy for OmniAuth.
                        Learn more and sign up at http://dev.tendrilinc.com/. }
  s.homepage      = 'https://github.com/activefx/omniauth-tendril'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.0.0'
  s.add_runtime_dependency 'faraday',         '~> 0.7.6'
  s.add_runtime_dependency 'multi_json',      '~> 1.2.0'
  s.add_runtime_dependency 'multi_xml',       '~> 0.4.2'

  s.add_development_dependency 'rspec', '~> 2.9.0'
  s.add_development_dependency 'rake'
end

