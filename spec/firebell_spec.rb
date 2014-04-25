require "spec_helper"

describe Firebell do
  describe "::configure" do
    it "returns a Configuration object to ::configuration" do
      configuration = Firebell.configure {}
      expect(configuration).to be_instance_of Firebell::Configuration
      expect(configuration).to eq Firebell.configuration
    end
  end
end
