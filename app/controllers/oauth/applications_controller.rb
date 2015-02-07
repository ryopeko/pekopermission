class Oauth::ApplicationsController < Doorkeeper::ApplicationsController
  include SessionsHelper
  before_filter :authenticate

  class AdminPermissionDeniedError < StandardError; end

  private
  def authenticate
    super
    raise AdminPermissionDeniedError unless signed_in_as_admin?
  end
end
