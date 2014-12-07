class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :name
  validates_presence_of :name, :password, on: :create

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token)
  end
end
