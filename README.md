# Firebell

Firebell notifier for Ruby

## Usage

```ruby
firebell = Firebell::Client.new

# simples
firebell.notify "project.category.event", "category has event"

# w/ attributes
firebell.notify "project.category.event", { "location" => "http://" }
```

## Installation

Add this line to your application's Gemfile:

    gem 'firebell'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install firebell

## Contributing

PR via [Github](https://github.com/ghostworks/firebell), suggestions to luke@ghostworks.io
