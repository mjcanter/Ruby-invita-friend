class User < ApplicationRecord
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :description, :presence => {:message => "Description can't be blank"}
  validates :password, :presence => {:message => "Password can't be blank"}
  validates :password, length: { minimum: 8 }

  has_many :friendships, foreign_key: "user_id"
  has_many :friends, through: :friendships

  has_many :invites, foreign_key: "user_id"
  has_many :invs, through: :invites

end
