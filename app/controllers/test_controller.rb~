class HomeController < ApplicationController
  def index
  end

  def tab
    var signed_request = params["signed_request"]
    @oauth = Koala::Facebook::OAuth.new(12345, "67c4c1fae14b74160cb7ef616cccb9e1")
    @parsed_request = @oauth.parse_signed_request(signed_request)
  end
end
