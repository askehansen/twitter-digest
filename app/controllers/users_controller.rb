class UsersController < ApplicationController
  before_action :require_login

  def edit
    @user = current_user
    @timezones = timezones
    @hours = (5..20).map do |hour|
      "#{hour}:00"
    end
  end

  def update
    @user = current_user
    @user.update! params[:user].permit(:email, :delivery_hour, :timezone)

    redirect_to daily_digests_path, notice: 'Settings were saved'
  end

  def destroy
    @user = current_user
    sign_out
    @user.destroy!

    redirect_to '/'
  end

  private

  def timezones
    entries = YAML.load(Rails.root.join("data", "timezones.yml").read)

    entries.map do |entry|
      [entry["group"], entry["zones"]]
    end
  end

end
