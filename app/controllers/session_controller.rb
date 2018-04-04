class SessionController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_from_auth_hash(auth)
    session[:user_id] = user.id
    session[:uid] = auth[:uid]
    session[:name] = auth[:info][:nickname]
    session[:oauth_token] = auth[:credentials][:token]
    session[:oauth_token_secret] = auth[:credentials][:secret]
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  protected
  def auth_hash
  end
end
