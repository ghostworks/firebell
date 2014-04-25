require "spec_helper"

describe Firebell::Configuration do
  it "automatically sets a hostname" do
    c = Firebell::Configuration.new
    expect(c.host).to eq "https://firebellapp.com"
  end

  it "automatically sets a path" do
    c = Firebell::Configuration.new
    expect(c.path).to eq "/api/v1/events"
  end

  it "generates an events URL" do
    c = Firebell::Configuration.new
    expect(c.url).to eq "https://firebellapp.com/api/v1/events"
  end

  it "accepts a non-standard hostname" do
    c = Firebell::Configuration.new
    c.host = "http://cowbell.dev"
    expect(c.url).to eq "http://cowbell.dev/api/v1/events"

  end
end
