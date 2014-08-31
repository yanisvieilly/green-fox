require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
  def setup
    @user = users(:john_doe)
    session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should not get index when not logged in" do
    session[:user_id] = nil
    get :index
    assert_redirected_to login_url
    assert_equal 'Only logged in users can access this page.', flash[:alert]
  end

  test "should destroy friendship" do
    assert_difference('Friendship.count', -2) do
      delete :destroy, { id: friendships(:three).id }
    end
    assert_response :success
  end
end
