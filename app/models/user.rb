class User < ApplicationRecord
  validates_uniqueness_of :username, message: 'username already exist'
  validates :username, presence: true, length: { minimum: 3, maximum: 30 }
  has_many :messages
  has_secure_password
end
