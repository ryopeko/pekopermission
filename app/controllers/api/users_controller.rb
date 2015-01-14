class Api::UsersController < Api::ApiController
  include Garage::RestfulActions


  def require_resources
    @resources = User.all
  end

  def index
  end
end
