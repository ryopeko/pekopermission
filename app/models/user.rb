class User < ActiveRecord::Base
  include Garage::Representer

  has_secure_password

  has_many :permissions
  has_many :user_roles
  has_many :roles, through: :user_roles

  property :id
  property :name

  validates_uniqueness_of :name
  validates_presence_of :name, :password, on: :create

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token)
  end

  def self.build_permissions(perms, other, target)
    perms.permits! :read
  end

  def build_permissions(perms, other)
    perms.permits! :read
    perms.permits! :write
  end

  def admin?
    !!self.roles.find_by(name: 'admin')
  end
end
