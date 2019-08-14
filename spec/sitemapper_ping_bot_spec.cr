require "./spec_helper"

describe Sitemapper::PingBot do
  Spec.before_each &->WebMock.reset

  describe "ping" do
    it "makes a GET request to google and bing" do
      WebMock.stub(:get, "https://www.google.com/webmasters/tools/ping?sitemap=https%3A%2F%2Fwww.example.com/sitemap.xml")
        .to_return(body: "")

      WebMock.stub(:get, "https://www.bing.com/webmaster/ping.aspx?siteMap=https%3A%2F%2Fwww.example.com/sitemap.xml")
        .to_return(body: "")

      bot = Sitemapper::PingBot.new("https://www.example.com/sitemap.xml")

      # how do I do this?
      # expect(HTTP::Client).to receive(:get).with("https://www.google.com/webmasters/tools/ping?sitemap=https%3A%2F%2Fwww.example.com/sitemap.xml")
      bot.ping
    end
  end
end
