class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to current_user.daily_digests.latest.first
    end
  end
end
