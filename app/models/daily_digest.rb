class DailyDigest < ApplicationRecord
  belongs_to :user

  scope :latest, -> { order(tweeted_on: :desc).limit(30) }

  def self.should_deliver_now
    self.where(user_id: User.should_deliver_digest_now.map(&:id)).select do |digest|
      digest.tweeted_on == digest.user.delivery_time.yesterday.to_date
    end
  end

  def tweets=(tweet_list)
    self.raw_tweets = tweet_list.map(&:as_json)
  end

  def tweets
    @_tweets ||= raw_tweets.map do |data|
      Twitter::Tweet.new(ActiveSupport::HashWithIndifferentAccess.new(data))
    end
  end

end
