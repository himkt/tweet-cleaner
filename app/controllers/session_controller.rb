class SessionController < ApplicationController
  def create
    user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: 'ログインしました'
  end

  def callback
    auth = request.env['omniauth.auth']

    session[:user_id] = auth[:uid]
    session[:name] = auth[:info][:nickname]
    session[:oauth_token] = auth[:credentials][:token]
    session[:oauth_token_secret] = auth[:credentials][:secret]

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
