class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # protect_from_forgery
  helper_method :current_user

  def login_required
    @current_user = current_user
    unless @current_user
      redirect_to root_path
    end
  end

  private
  def current_user
    @current_user ||= SessionUser.new(session) if session[:user_id]
  end
end
