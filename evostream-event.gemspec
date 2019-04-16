# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'evostream/event/info'

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
  spec.files         += Dir['bin/evostream']

  spec.bindir        = 'bin'
  spec.executables   = ['evostream']

  spec.require_paths = ['lib']

  spec.post_install_message = Evostream::POST_INSTALL

  spec.required_ruby_version = '>= 2.4.0'

  spec.add_development_dependency 'capybara', '~> 2.13'
  spec.add_development_dependency 'faker', '~> 1.7', '>= 1.7.3'
  spec.add_development_dependency 'fuubar', '~> 2.2'
  spec.add_development_dependency 'overcommit', '~> 0.34.2'
  spec.add_development_dependency 'pry-byebug', '~> 3.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek', '~> 4.8'
  spec.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
  spec.add_development_dependency 'rubocop', '~> 0.67.2'
  spec.add_development_dependency 'sinatra', '~> 2.0.1'
  spec.add_development_dependency 'travis', '~> 1.8', '>= 1.8.4'
  spec.add_development_dependency 'webmock', '~> 2.3', '>= 2.3.2'
  spec.add_development_dependency 'yard', '~> 0.9.11'

  spec.add_runtime_dependency 'activesupport', '~> 4.2'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
end
