require 'httpclient'
require 'nokogiri'

module ExpertSearch
  class HeadingExtractor
    def self.extract(url)
      self.new(url).extract
    end

    def initialize(url)
      @url = url
    end

    def extract
      h1s = parsed_page.css("h1").map { |el| el.text }
      h2s = parsed_page.css("h2").map { |el| el.text }
      h3s = parsed_page.css("h3").map { |el| el.text }

      {
        h1: h1s,
        h2: h2s,
        h3: h3s
      }
    end

    private

    def client
      @client ||= HTTPClient.new
    end

    def parsed_page
      # This should obviously be a bit more robust
      # in the real world to make sure the call
      # was successful
      @parsed_page ||= Nokogiri::HTML.parse(client.get(@url).body)
    end
  end
end
