Garage.configure {}

Garage::TokenScope.configure do
  register :public, desc: 'acessing publicly available data' do
    access :read, User
    access :write, User
  end
end

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)


  admin_authenticator do |routes|
    User.find_by(name: params[:name]).try(:admin?) || (raise ActionController::RoutingError.new('Not Found'))
  end

  resource_owner_from_credentials do |routes|
    User.find_by(name: params[:name])
  end
end
