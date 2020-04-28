class DailyDigestsController < ApplicationController
  before_action :require_login, except: :show

  def new
    if digest = current_user.daily_digests.latest.first
      return redirect_to digest
    end

    @digest = DailyDigest.create(user: current_user)
    PrepareDigestJob.perform_later(@digest)
  end

  def index
    @digests = current_user.daily_digests.latest
  end

  def show
    @digest = DailyDigest.find_by_hashid(params[:id])
    @tweets = @digest.sorted_tweets
  end
end
