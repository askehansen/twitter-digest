# Preview all emails at http://localhost:3000/rails/mailers/daily_digest_mailer
class DailyDigestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/daily_digest_mailer/yesterdays_tweets
  def yesterdays_tweets
    DailyDigestMailer.yesterdays_tweets(DailyDigest.last)
  end

end
