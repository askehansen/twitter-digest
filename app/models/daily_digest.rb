class DailyDigest < ApplicationRecord
  belongs_to :user

  scope :latest, -> { order(tweeted_on: :desc).limit(30) }

  def tweets=(tweet_list)
    self.raw_tweets = tweet_list.map(&:as_json)
  end

  def tweets
    @_tweets ||= raw_tweets.map do |data|
      Twitter::Tweet.new(ActiveSupport::HashWithIndifferentAccess.new(data))
    end
  end

end
