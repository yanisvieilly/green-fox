class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :add_inverse_friendship
  after_destroy :remove_inverse_friendship

  private
    def add_inverse_friendship
      Friendship.find_or_create_by(user_id: self.friend_id, friend_id: self.user_id)
    end

    def remove_inverse_friendship
      Friendship.find_by(user_id: self.friend_id, friend_id: self.user_id).try(:destroy)
    end
end
