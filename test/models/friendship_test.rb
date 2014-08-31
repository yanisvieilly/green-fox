require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  test "should create an inverse friendship when created" do
    assert_difference('Friendship.count', 2) do
      Friendship.create(user_id: users(:john_doe).id, friend_id: users(:jack_three).id)
    end
    assert users(:john_doe).friends.include? users(:jack_three)
    assert users(:jack_three).friends.include? users(:john_doe)
  end

  test "should remove the opposite friendship when destroyed" do
    assert_difference('Friendship.count', -2) do
      friendships(:one).destroy
    end
    assert_not users(:jack_three).friends.include? users(:mal_icious)
    assert_not users(:mal_icious).friends.include? users(:jack_three)
  end
end
