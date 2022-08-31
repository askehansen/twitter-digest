class SessionsController < ApplicationController

  def create
    @user = User.find_by(twitter_uid: twitter_data["twitter_uid"])

    if @user
      sign_in(@user)
      redirect_to daily_digests_path
    else
      session[:new_user] = User.new(twitter_data)
      redirect_to new_users_path
    end

  end

  def destroy
    sign_out
    redirect_to '/'
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
