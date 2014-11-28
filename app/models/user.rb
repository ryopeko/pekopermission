class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :password, on: :create

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token)
  end
end
