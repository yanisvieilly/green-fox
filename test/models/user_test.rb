require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user with invalid attributes" do
    invalid_user = User.new
    assert_not invalid_user.save
  end

  test "should save user with valid attributes" do
    user = users(:valid_user)
    assert user.save
  end
end
