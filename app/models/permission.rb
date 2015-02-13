class Permission < ActiveRecord::Base
  include Garage::Representer

  belongs_to :user

  validates_presence_of :name, :user_id, :enabled

  property :id
  property :name
  property :user_id
  property :enabled

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end
end
