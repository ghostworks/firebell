require 'bundler/setup'
Bundler.setup

require 'firebell'

RSpec.configure do |c|
  c.mock_with :mocha

  c.after(:each) do
    Firebell.remove_class_variable :@@configuration if Firebell.class_variable_defined? :@@configuration
  end
end
