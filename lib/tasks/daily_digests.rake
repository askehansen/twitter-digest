namespace :daily_digests do

  desc "Creates a digest for yesterday"
  task create: :environment do
    User.find_each do |user|
      Timber.with_context(user: { id: user.id, email: user.email }) do
        Rails.logger.info("Creating daily digest")
        digest = DailyDigest.new(user: user, tweeted_on: 1.day.ago.to_date)

        timeline =  Timeline.new(user, time_frame: [digest.tweeted_on.beginning_of_day, digest.tweeted_on.end_of_day])
        digest.tweets = timeline.tweets

        digest.save!

        Rails.logger.info("Created daily digest", digest_created: { id: digest.id })
      end
    end
  end

  desc "Delivers digests from yesterday"
  task deliver: :environment do
    DailyDigest.where(tweeted_on: 1.day.ago.to_date).find_each do |digest|
      Timber.with_context(user: { id: digest.user.id, email: digest.user.email }) do
        Rails.logger.info("Delivering daily digest", digest_delivered: { id: digest.id })
        DailyDigestMailer.yesterdays_tweets(digest).deliver_now
        Rails.logger.info("Delivered daily digest", digest_delivered: { id: digest.id })
      end
    end
  end

end
