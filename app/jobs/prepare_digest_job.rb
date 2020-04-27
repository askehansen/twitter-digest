class PrepareDigestJob < ApplicationJob
  queue_as :default

  def perform(digest, yesterday: nil)
    yesterday ||= digest.user.delivery_time.yesterday
    digest.tweeted_on = yesterday.to_date

    timeline =  Timeline.new(digest.user, time_frame: [yesterday.beginning_of_day, yesterday.end_of_day])
    digest.tweets = timeline.tweets

    digest.save!

    NewDigestChannel.broadcast_to(digest.user, status: "ready")
  end
end
