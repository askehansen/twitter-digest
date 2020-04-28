namespace :daily_digests do

  desc "Creates a digest for yesterday"
  task create: :environment do
    User.should_create_digest_now.each do |user|
      Timber.with_context(user: { id: user.id, email: user.email, timezone: user.timezone, delivery_hour: user.delivery_hour }) do
        Rails.logger.info("Creating daily digest")
        PrepareDigestJob.perform_later(DailyDigest.create(user: user))
        Rails.logger.info("Created daily digest", digest_created: { id: digest.id })
      end
    end
  end

  desc "Delivers digests from yesterday"
  task deliver: :environment do
    DailyDigest.should_deliver_now.each do |digest|
      Timber.with_context(digest: { id: digest.id }, user: { id: digest.user.id, email: digest.user.email, timezone: digest.user.timezone, delivery_hour: digest.user.delivery_hour }) do
        Rails.logger.info("Delivering daily digest", digest_delivered: { id: digest.id })
        DailyDigestMailer.yesterdays_tweets(digest).deliver_now
        Rails.logger.info("Delivered daily digest", digest_delivered: { id: digest.id })
      end
    end
  end

end
