require 'test_helper'

class DailyDigestMailerTest < ActionMailer::TestCase
  test "yesterdays_tweets" do
    mail = DailyDigestMailer.yesterdays_tweets
    assert_equal "Yesterdays tweets", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
