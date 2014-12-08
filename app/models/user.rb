class User < ActiveRecord::Base
  has_secure_password

  has_many :permissions

  validates_uniqueness_of :name
  validates_presence_of :name, :password, on: :create

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token)
  end
end
