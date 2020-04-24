class HomeController < ApplicationController
  def index
    if signed_in?
      @digests = current_user.daily_digests.latest
    end
  end
end
