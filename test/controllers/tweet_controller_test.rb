require 'test_helper'

class TweetControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get tweet_index_url
    assert_response :success
  end

  # FIXME how to make specs for controller's classmethod
  test "include_white_list_token should be true" do
    TweetController.include_white_list_token 'arxiv'
  end

  test "is_retweet shold be true" do
    TweetController.is_retweet? 'RT main'
  end

  test "is_engli should be true" do
    TweetController.is_english? 'I like apple'
  end
end
