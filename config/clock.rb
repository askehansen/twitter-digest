require './config/boot'
require './config/environment'

module Clockwork

  every 1.hour, "Create a digest for yesterday", at: "**:00" do
    User.should_create_digest_now.each do |user|
      Rails.logger.info("Creating daily digest")
      PrepareDigestJob.perform_later(DailyDigest.create(user: user))
      Rails.logger.info("Created daily digest")
    end
  end

  every 1.hour, "Deliver digests from yesterday", at: "**:00" do
    DailyDigest.should_deliver_now.each do |digest|
      Timber.with_context(digest: { id: digest.id }, user: { id: digest.user.id, email: digest.user.email, timezone: digest.user.timezone, delivery_hour: digest.user.delivery_hour }) do
        Rails.logger.info("Delivering daily digest", digest_delivered: { id: digest.id })
        DailyDigestMailer.yesterdays_tweets(digest).deliver_now
        Rails.logger.info("Delivered daily digest", digest_delivered: { id: digest.id })
      end
    end
  end

end