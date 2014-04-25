# Firebell

Firebell notifier for Ruby

## Usage

```ruby
firebell = Firebell::Client.new

# creating events

# with just a tag
firebell.notify "project.category.event"

# with a body
firebell.notify "project.category.event", "category has event"

# with parameters
firebell.notify "project.category.event", "location" => "http://server/file"

# with both
firebell.notify "project.category.event", "location" => "http://server/file", "category has event"
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
