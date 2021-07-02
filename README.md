# Evostream::Event
  [![RSpec](https://github.com/dazzl-tv/evostream-event/actions/workflows/rspec.yml/badge.svg)](https://github.com/dazzl-tv/evostream-event/actions/workflows/rspec.yml)
  [![Linter](https://github.com/dazzl-tv/evostream-event/actions/workflows/linter.yml/badge.svg)](https://github.com/dazzl-tv/evostream-event/actions/workflows/linter.yml)
  [![Gem Version](https://badge.fury.io/rb/evostream-event.svg)](https://badge.fury.io/rb/evostream-event)
  [![Docs](https://inch-ci.org/github/dazzl-tv/evostream-event.svg)](https://inch-ci.org/github/dazzl-tv/evostream-event)
  [![Maintainability](https://api.codeclimate.com/v1/badges/aeb223699c46a3e6e76c/maintainability)](https://codeclimate.com/github/dazzl-tv/evostream-event/maintainability)
  [![Test Coverage](https://api.codeclimate.com/v1/badges/aeb223699c46a3e6e76c/test_coverage)](https://codeclimate.com/github/dazzl-tv/evostream-event/test_coverage)
  [![Known Vulnerabilities](https://snyk.io/test/github/dazzl-tv/evostream-event/badge.svg)](https://snyk.io/test/github/dazzl-tv/evostream-event)

Evostream Event listen event to Evostream and execute task.

## Menu

* [How to use](#how-to-use)
  * [Installation](#installation)
  * [Usage](#usage)
* [Development](#development)
* [Contributing](#contributing)

## How to use

### Installation

Add this line to your application's Gemfile:

```ruby
gem 'evostream-event'
```

And then execute :

```linux
bundle
```

Or install it yourself as :

```linux
gem install evostream-event
```

### Environment

This gem use a configuration file for configure access to EvoStream server.

See initializer file.
```ruby
# URL to EvoStream for share video to final user
config.uri_in       = 'http://server_stream.local:80'

# URL to EvoStream for sending request to this API
config.uri_out      = 'http://server_stream.local:7777'

# Prefix to folder created for each video mangaed by EvoStream
config.name         = 'srteamming_'

# Folder for file created by EvoStream
config.web_root     = '/var/www/html'

# Name to model manipulate
config.model        = ModelUsedInDatabase

# Choose id to document manipulate in Database
config.model_id     = :identifier_used_in_model

# Use environment for this gem. Choose between :
# - development   : Write in log and Send request to EvoStream
# - test          : Write in Log
# - production    : Send request to EvoStream
config.environement = :test
```
### Usage

Create initializer :

```linux
rails generator evostream:initializer
```

Treatment evostream request :

```ruby
event = Evostream::Event.new(params[:type], params[:payload].to_unsafe_h)
event.execute_action
```

### Usage in cli

Use this gem in CLI. For more explain use helper :

```linux
evostream -h
```

Example for delete a configuration :

```linux
evostream removeConfig 'id: 565'
```

Example for list configuration :

```linux
# All configuration
evostream listConfig

# Just configuration number 42
evostream -s 'configId: 42' listConfig
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/dazzl-tv/evostream-event. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
