class User < ActiveRecord::Base
  include Garage::Representer

  has_secure_password

  has_many :permissions

  property :id
  property :name

  validates_uniqueness_of :name
  validates_presence_of :name, :password, on: :create

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token)
  end
end
