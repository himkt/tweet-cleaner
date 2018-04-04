class TweetController < ApplicationController
  WHITE_LIST = %w(arxiv feedly Hatena)

  def index
    delete_tweets
  end

  def include_white_list_token? tweet
    results = WHITE_LIST.map {|white_word| tweet.match(white_word)}
    results.any?
  end

  def is_retweet? tweet
    tweet.match(/^RT/)
  end

  def is_english? tweet
    tweet = tweet.gsub(/[\d\s\.,\:\\\/_]/, '')

    counter = Hash.new(0)
    char_list = tweet.split(//)
    char_list.each do |char|
      counter[char] += 1
    end


    f = counter
      .select {|c, v| c =~ /[A-Za-z]/}
      .values
      .inject(0.0) {|sum, i| sum+=i}

    z = counter.
      values.
      inject(0.0) {|sum, i| sum+=i}

    alphabet_ratio = f / z
    return alphabet_ratio >= 0.75
  end

  def delete_tweets
    limit = 5
    param = {"count" => 200}

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_API_SECRET']
      config.access_token        = session[:oauth_token]
      config.access_token_secret = session[:oauth_token_secret]
    end
    p client

    # 1.upto 16 do |page|
    #   tweets = client.user_timeline(param)
    #   tweets.each_with_index do |tweet, i|
    #     if tweet.favorite_count < limit
    #       next if include_white_list_token?(tweet.text)
    #       next if is_retweet?(tweet.text)
    #       next if is_english?(tweet.text)
    #       client.destroy_status(tweet.id)
    #     end
    #   end
    # end
  end
end
