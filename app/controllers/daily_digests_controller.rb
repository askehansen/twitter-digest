class DailyDigestsController < ApplicationController

  def show
    @digest = DailyDigest.find(params[:id])
    @tweets = @digest.tweets.sort_by(&:favorite_count).reverse
  end
end
