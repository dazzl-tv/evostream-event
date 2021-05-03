# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'evostream/event/info'

Gem::Specification.new do |spec|
  spec.version = if ENV['GITHUB_REF'].eql?('refs/heads/develop')
                   "#{Evostream::VERSION}.pre.#{ENV['GITHUB_RUN_ID']}"
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

  spec.required_ruby_version = '>= 2.6.0'

  spec.add_development_dependency 'faker', '~> 2.17'
  spec.add_development_dependency 'pry-byebug', '~> 3.9'
  spec.add_development_dependency 'rake', '~> 13.0.3'
  spec.add_development_dependency 'reek', '~> 6.0.4'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.13.0'
  spec.add_development_dependency 'rubocop-faker', '~> 1.1'
  spec.add_development_dependency 'webmock', '~> 3.12.2'
  spec.add_development_dependency 'yard', '~> 0.9.26'

  spec.add_runtime_dependency 'activesupport', '~> 6.1.3.1'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
end
