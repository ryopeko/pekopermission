class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def authenticate
    redirect_to signin_path, notice: 'Please, Sign in' unless signed_in?
  end

  def sign_in(user)
    remember_token = SecureRandom.urlsafe_base64
    session[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    @current_user = user
  end

  def current_user
    remember_token = session[:remember_token] || return
    @current_user ||= User.find_by(remember_token: User.encrypt(remember_token))
  end

  def signed_in?
    !current_user.nil?
  end
end
