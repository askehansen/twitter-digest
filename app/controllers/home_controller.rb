class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to daily_digests_path
    end
  end
end
