class Permission < ActiveRecord::Base
  validates_presence_of :name, :user_id, :enabled
end
