class DailyDigestsController < ApplicationController
  before_action :require_login, except: :show

  def new
    if @digest = current_user.daily_digests.latest.first
      redirect_to @digest
    else
      @digest = DailyDigest.create(user: current_user)
      CreateNewDigestJob.perform_later(@digest)
    end
  end

  def index
    @digests = current_user.daily_digests.latest
  end

  def show
    @digest = DailyDigest.find(params[:id])
    @tweets = @digest.sorted_tweets
  end
end
