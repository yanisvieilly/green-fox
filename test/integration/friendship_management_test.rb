require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    existing_user = {
      provider: 'twitter',
      uid: users(:john_doe).uid
    }
    OmniAuth.config.add_mock(:twitter, existing_user)

    visit '/login'
    click_link 'Sign in with Twitter'
  end

  def teardown
    visit '/logout'
  end

  test "should be able to accept a friend request" do
    within('ul#requests') do
      assert_not users(:john_doe).friends.include? users(:jack_three)
      assert_difference('Friendship.count', 2) do
        click_link 'Accept'
      end
      assert users(:john_doe).friends.include? users(:jack_three)
    end
  end

  test "should be able to decline a friend request" do
    within('ul#requests') do
      assert_not users(:john_doe).friends.include? users(:jack_three)
      assert_no_difference('Friendship.count') do
        click_link 'Decline'
      end
      assert_not users(:john_doe).friends.include? users(:jack_three)
    end
  end
end
