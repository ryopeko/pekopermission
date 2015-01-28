class UserRole < ActiveRecord::Base
  belongs_to :user_id
  belongs_to :role_id
end
