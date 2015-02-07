module SessionsHelper
  def authenticate
    redirect_to signin_path, notice: 'Please, Sign in' unless signed_in?
  end

  def signin(user)
    remember_token = SecureRandom.urlsafe_base64
    session[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    @current_user = user
  end

  def signout
    current_user.try(:update_attribute, :remember_token, nil)
    reset_session

    @current_user = nil
  end

  def current_user
    remember_token = session[:remember_token] || return
    @current_user ||= User.find_by(remember_token: User.encrypt(remember_token))
  end

  def signed_in?
    !current_user.nil?
  end

  def signed_in_as_admin?
    !!(signed_in? && current_user.admin?)
  end
end
