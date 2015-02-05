class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  include SessionsHelper
  before_filter :authenticate

  private
  def authenticate
    super
    redirect_to signin_path, notice: 'You cannot access a this page.' unless current_user.admin?
  end
end
