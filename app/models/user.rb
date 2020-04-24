class User < ApplicationRecord
  include Clearance::User

  attr_encrypted :twitter_consumer_key, key: :encryption_key
  attr_encrypted :twitter_consumer_secret, key: :encryption_key
  attr_encrypted :twitter_access_token, key: :encryption_key
  attr_encrypted :twitter_access_token_secret, key: :encryption_key

  has_many :daily_digests, dependent: :destroy

  private

  def encryption_key
    ENV['ENCRYPTION_KEY']
  end

end
