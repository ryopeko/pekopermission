Garage.configure {}

Garage::TokenScope.configure do
  register :personal do
    access :read, User
    access :write, User

    access :read, Permission
    access :write, Permission
  end
end

Doorkeeper.configure do
  orm :active_record
  default_scopes :personal
  optional_scopes(*Garage::TokenScope.optional_scopes)

  resource_owner_from_credentials do |routes|
    User.find_by(name: params[:name])
  end
end
