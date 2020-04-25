class DailyDigestsController < ApplicationController

  def index
    require_login
    @digests = current_user.daily_digests.latest
  end

  def show
    @digest = DailyDigest.find(params[:id])
    @tweets = @digest.tweets.sort_by(&:favorite_count).reverse
  end
end
