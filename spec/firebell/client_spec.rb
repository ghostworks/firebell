require "spec_helper"

describe Firebell::Client do
  let(:client) { Firebell::Client.new "token" }

  describe "#uri" do
    it "is HTTPS by default" do
      expect(client.send(:uri)).to be_instance_of URI::HTTPS
    end

    it "is a URI object of the configured URL" do
      expect(client.send(:uri)).to eq URI.parse Firebell.configuration.url
    end
  end


  context "with a tag and body" do
    it "makes a request" do
      Firebell::Client.any_instance.expects(:send_request).with("tag" => "test.subject", "body" => "hello")
      client.notify "test.subject", "hello"
    end
  end

  context "with a tag and parameters" do
    it "makes a request" do
      Firebell::Client.any_instance.expects(:send_request)
        .with("tag" => "test.subject", "parameters" => { "p1" => 1 })

      client.notify "test.subject", "p1" => 1
    end
  end

  context "with a tag, parameters, and body" do
    it "makes a request" do
      Firebell::Client.any_instance.expects(:send_request)
        .with("tag" => "test.subject", "parameters" => { "p1" => 1 }, "body" => "hello")

      client.notify "test.subject", { "p1" => 1 }, "hello"
    end
  end

  context "with just a tag" do
    it "makes a request" do
      Firebell::Client.any_instance.expects(:send_request)
        .with("tag" => "test.subject")

      client.notify "test.subject"
    end
  end

  describe "release stages" do
    context "with a correct release stage set" do
      before do
        Firebell.configuration.notify_release_stages = %w{production staging}
        Firebell.configuration.release_stage = "production"
      end

      it "makes a request" do
        Firebell::Client.any_instance.expects(:send_request)
          .with("tag" => "test.subject")

        client.notify "test.subject"
      end
    end

    context "with an incorrect release stage set" do
      before do
        Firebell.configuration.notify_release_stages = %w{production staging}
        Firebell.configuration.release_stage = "development"
      end

      it "makes a request" do
        Firebell::Client.any_instance.expects(:send_request).never

        client.notify "test.subject"
      end
    end
  end
end
