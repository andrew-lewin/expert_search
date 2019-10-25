require 'test_helper'

module ExpertSearch
  class HeadingExtractorTest < ActiveSupport::TestCase
    test "should return a hash of h1, h2, and h3 headings on the page" do
      # I really should stub the http_client call that's made when calling this
      # but I've opted not to for this test so I can get to some of the more
      # interesting things
      result = HeadingExtractor.extract("http://www.lolcats.com/")
      expected_result = {
        h1: ["Funny cat pictures with hilarious captions!"],
        h2: [
          "Taste good but I can't feel my whiskers!",
          "Merry Christmas from LOLCats.com!",
          "iz likin myself on lolcats.com",
          "shhhh... i is nap-kin",
          "Littl dus she no... iz jus pooped",
          "I can has prom date?",
          "Trending lolz"
        ],
        h3: ["Click 'like' if you love LOLCats!", "Follow LOLCats on Twitter!"]
      }
      assert result == expected_result
    end
  end
end
