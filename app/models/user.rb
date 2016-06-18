class User < ActiveRecord::Base
  has_secure_password

  has_many :boards

  validates_presence_of :login
end
