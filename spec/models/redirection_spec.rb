require "spec_helper"

RSpec.describe Redirection do
  let(:url_request) { described_class.new("http://test.com") }

  describe "#redirects_to_www?" do
    subject { url_request.redirects_to_www? }

    context "redirects to www" do

      it "returns true" do
        expect(subject).to eq true
      end
    end

    context "does not redirect to www" do
      let(:url_request) { described_class.new("http://testfail.com") }

      it "returns false" do
        expect(subject).to eq false
      end
    end
  end

  describe "#redirects_to_https?" do
    subject { url_request.redirects_to_https? }

    context "redirects to https" do
      it "returns true" do
        expect(subject).to eq true
      end
    end

    context "does not redirect to https" do
      let(:url_request) { described_class.new("http://testfail.com") }

      it "returns false" do
        expect(subject).to eq false
      end
    end
  end

  describe "#redirection" do
    subject { url_request.redirection }

    context "redirects to https" do
      it "returns a new url" do
        expect(subject).to eq "https://www.test.com/"
      end
    end

    context "does not redirect to https" do
      let(:url_request) { described_class.new("http://testfail.com") }

      it "returns the same url" do
        expect(subject).to eq "http://testfail.com"
      end
    end
  end
end
