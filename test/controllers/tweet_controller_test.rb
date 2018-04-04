require 'test_helper'

class TweetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweet_index_url
    assert_response :success
  end

end
