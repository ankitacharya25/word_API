class User < ApplicationRecord
  has_secure_password
  has_many :apikeys
  validates :email, presence: true, uniqueness: true
end
