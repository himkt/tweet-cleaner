class User < ApplicationRecord

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    screen_name = auth_hash[:info][:screen_name]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by(provider: provider, uid: uid) do |user|
      user.screen_name = screen_name
      user.image_url = image_url
    end
  end
end
