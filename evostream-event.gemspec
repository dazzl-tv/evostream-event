# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'evostream/info'

Gem::Specification.new do |spec|
  spec.version = if ENV['TRAVIS'] && !ENV['TRAVIS_BRANCH'].eql?('master')
                   "#{Evostream::VERSION}-#{ENV['TRAVIS_BUILD_NUMBER']}"
                 else
                   Evostream::VERSION
                 end
  spec.name          = Evostream::GEM_NAME
  spec.authors       = Evostream::AUTHORS
  spec.email         = Evostream::EMAILS

  spec.summary       = Evostream::SUMMARY
  spec.description   = Evostream::DESCRIPTION

  spec.homepage      = Evostream::HOMEPAGE
  spec.license       = Evostream::LICENSE

  spec.files         = ['Gemfile', 'LICENSE', 'Rakefile', 'README.md']
  spec.files         += Dir['lib/**/*']
  spec.files         += Dir['spec/**/*']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.require_paths = ['lib']

  spec.post_install_message = Evostream::POST_INSTALL

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
  spec.add_development_dependency 'overcommit', '~> 0.34.2'
  spec.add_development_dependency 'rubocop', '~> 0.42.0'
  spec.add_development_dependency 'yard', '~> 0.9.5'
  spec.add_development_dependency 'reek', '~> 4.2', '>= 4.2.4'
  spec.add_development_dependency 'fuubar', '~> 2.2'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'travis', '~> 1.8', '>= 1.8.4'
  spec.add_development_dependency 'rails', '~> 4.2', '>= 4.2.8'
  spec.add_development_dependency 'faker', '~> 1.7', '>= 1.7.3'
end
