class Api::UsersController < ApplicationController
  include Garage::ControllerHelper
  include Garage::RestfulActions

  def current_resource_owner
    @current_resource_owner ||= User.find(resource_owner_id) if resource_owner_id
  end


  def require_resources
    @resources = User.all
  end

  def index
  end
end
