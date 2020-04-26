class Timeline

  def initialize(user, time_frame: [1.day.ago.beginning_of_day, 1.day.ago.end_of_day])
    @user = user
    @time_frame = time_frame
  end

  def tweets
    Rails.logger.info("Fetching timeline initial")
    @items = client.home_timeline(count: 200, tweet_mode: "extended")

    while @items.last.created_at > @time_frame.first
      Rails.logger.info("Fetching timeline before #{@items.last.created_at}")
      @items = @items + client.home_timeline(count: 200, max_id: @items.last.id, tweet_mode: "extended")
    end

    @items.select do |item|
      item.created_at.between?(*@time_frame)
    end
  end

  private

  def client
    @_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = @user.twitter_consumer_key
      config.consumer_secret     = @user.twitter_consumer_secret
      config.access_token        = @user.twitter_access_token
      config.access_token_secret = @user.twitter_access_token_secret
    end
  end

end
