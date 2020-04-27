class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by(twitter_uid: twitter_data["twitter_uid"])

    if @user
      sign_in(@user)
      redirect_to daily_digests_path
    else
      session[:new_user] = User.new(twitter_data)
      redirect_to auth_add_email_path
    end

  end

  def destroy
    sign_out
    redirect_to '/'
  end

  def add_email
    @user = User.new(session[:new_user])
  end

  def update_email
    @user = User.new(session[:new_user])
    @user.email = params[:user][:email]
    @user.password = SecureRandom.hex
    @user.timezone = "UTC"
    @user.delivery_hour = "9:00"
    @user.save!
    session[:new_user] = nil

    sign_in(@user)
    redirect_to new_daily_digest_path
  end


  private

  def twitter_data
    auth_data = request.env['omniauth.auth']
    {
      "twitter_consumer_key" => auth_data.extra.access_token.consumer.key,
      "twitter_consumer_secret" => auth_data.extra.access_token.consumer.secret,
      "twitter_access_token" => auth_data.credentials.token,
      "twitter_access_token_secret" => auth_data.credentials.secret,
      "twitter_uid" => auth_data.uid,
      "twitter_nickname" => auth_data.info.nickname,
      "twitter_name" => auth_data.info.name,
      "twitter_image" => auth_data.info.image,
    }
  end

end
