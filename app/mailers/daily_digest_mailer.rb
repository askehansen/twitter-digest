class DailyDigestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_digest_mailer.yesterdays_tweets.subject
  #
  def yesterdays_tweets(digest)
    @digest = digest
    @user = digest.user
    @tweets = digest.sorted_tweets.take(20)

    mail to: "#{@user.twitter_name} <#{@user.email}>", subject: "Tweets from #{l digest.tweeted_on, format: :long}"
  end
end
