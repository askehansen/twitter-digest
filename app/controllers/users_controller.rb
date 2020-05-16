class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  class NoUserSessionError < StandardError
  end

  def new
    raise NoUserSessionError if session[:new_user].nil?

    @user = User.new(session[:new_user])
  end

  def create
    raise NoUserSessionError if session[:new_user].nil?
    
    @user = User.new(session[:new_user])
    @user.email = params[:user][:email]
    @user.password = SecureRandom.hex
    @user.timezone = FindTimezone.find(params[:user][:timezone])&.name
    @user.delivery_hour = "9:00"
    @user.save!
    session[:new_user] = nil

    sign_in(@user)
    redirect_to new_daily_digest_path
  end

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
    groups = ActiveSupport::TimeZone.all.group_by(&:formatted_offset)

    groups.map do |offest, zones|
      [offest, zones.map(&:name)]
    end
  end

end
