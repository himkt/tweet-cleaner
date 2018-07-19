Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    ENV['TWITTER_API_KEY'],
    ENV['TWITTER_API_KEY_SECRET'],
    {:secure_image_url => 'true',
     :image_size => 'original',
     :authorize_params => {
       :force_login => 'true',
       :lang => 'pt'
     }}
end
