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
    attr_writer :host, :url, :notify_release_stages
    attr_accessor :token, :release_stage

    def host
      @host ||= "https://firebellapp.com"
    end

    def path
      @path ||= "/api/v1/events"
    end

    def url
      @url ||= "#{host}#{path}"
    end

    def notify_release_stages
      @notify_release_stages ||= []
    end
  end
end

require "firebell/client"
