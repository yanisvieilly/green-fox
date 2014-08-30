class User < ActiveRecord::Base
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, after_add: :add_inverse_friendship, after_remove: :remove_inverse_friendship

  has_many :requests, foreign_key: :requester_id
  has_many :inverse_requests, class_name: 'Request', foreign_key: :requested_id

  validates :uid, :provider, :nickname, presence: true
  validates :nickname, uniqueness: true

  private
    def add_inverse_friendship(friend)
      friend.friends << self unless friend.friends.include?(self)
    end

    def remove_inverse_friendship(friend)
      friend.friends.delete(self) if friend.friends.include?(self)
    end
end
