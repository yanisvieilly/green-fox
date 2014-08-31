class User < ActiveRecord::Base
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :requests, foreign_key: :requester_id
  has_many :inverse_requests, class_name: 'Request', foreign_key: :requested_id

  validates :uid, :provider, :nickname, presence: true
  validates :nickname, uniqueness: true
end
