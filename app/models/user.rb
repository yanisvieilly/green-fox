class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships

  validates :uid, :provider, :nickname, presence: true
end
