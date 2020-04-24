namespace :daily_digests do

  desc "Creates a digest for yesterday"
  task create: :environment do
    User.find_each do |user|
      Rails.logger.info("Creating daily")
      digest = DailyDigest.new(user: user, tweeted_on: 1.day.ago.to_date)

      timeline =  Timeline.new(user, time_frame: [digest.tweeted_on.beginning_of_day, digest.tweeted_on.end_of_day])
      digest.tweets = timeline.tweets

      digest.save!
    end
  end

  desc "Delivers digests from yesterday"
  task deliver: :environment do
    DailyDigest.where(tweeted_on: 1.day.ago.to_date).find_each do |digest|
      DailyDigestMailer.yesterdays_tweets(digest).deliver_now
    end
  end

end
