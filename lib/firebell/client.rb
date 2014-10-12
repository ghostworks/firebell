require "net/http"

class Firebell::Client
  attr_accessor :token

  def initialize(token = Firebell.configuration.token)
    @token = token
  end

  def notify(tag, body_or_params = nil, body = nil)
    if body_or_params
      if body_or_params.is_a?(Hash)
        attributes = { "tag" => tag, "parameters" => body_or_params }
        attributes.merge!("body" => body) if body
      else
        attributes = { "tag" => tag, "body" => body_or_params }
      end
    else
      attributes = { "tag" => tag }
    end

    send_request attributes if requestable?
  end

  private
  def send_request(attrs)
    request = Net::HTTP::Post.new uri.request_uri, "Authorization" => "Token #{@token}"
    request.set_form_data attrs

    http.request(request)
  end

  def http
    @http ||= begin
      http = Net::HTTP.new uri.host, uri.port
      http.use_ssl = true if uri.is_a?(URI::HTTPS)
      http
    end
  end

  def uri
    @uri ||= URI.parse Firebell.configuration.url
  end

  def requestable?
    if Firebell.configuration.notify_release_stages.any?
      Firebell.configuration.notify_release_stages.include? Firebell.configuration.release_stage
    else
      true
    end
  end
end
