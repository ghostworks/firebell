require "firebell/version"

module Firebell
  def self.configure
    yield configuration
    configuration
  end

  def self.configuration
    @@configuration ||= Configuration.new
  end

  class Configuration
    attr_writer :host, :url
    attr_accessor :token

    def host
      @host ||= "https://firebellapp.com"
    end

    def path
      @path ||= "/api/v1/events"
    end

    def url
      @url ||= "#{host}#{path}"
    end

  end
end

require "firebell/client"
