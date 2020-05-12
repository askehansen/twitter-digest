class User < ApplicationRecord
  include Clearance::User
  TIME_PADDING = [-15, 15]

  attr_encrypted :twitter_consumer_key, key: :encryption_key
  attr_encrypted :twitter_consumer_secret, key: :encryption_key
  attr_encrypted :twitter_access_token, key: :encryption_key
  attr_encrypted :twitter_access_token_secret, key: :encryption_key

  has_many :daily_digests, dependent: :destroy

  def self.should_create_digest_now
    self.all.select do |user|
      run_time = user.delivery_time - 1.hour
      minutes_between = (user.local_time - run_time) / 1.minute
      minutes_between.between?(*TIME_PADDING)
    end
  end

  def self.should_deliver_digest_now
    self.all.select do |user|
      minutes_between = (user.local_time - user.delivery_time) / 1.minute
      minutes_between.between?(*TIME_PADDING)
    end
  end

  def local_time
    Time.use_zone(timezone) do
      Time.zone.now
    end
  end

  def delivery_time
    Time.use_zone(timezone) do
      Time.zone.local(local_time.year, local_time.month, local_time.day, delivery_hour.to_i)
    end
  end

  private

  def encryption_key
    ENV['ENCRYPTION_KEY']
  end


end
