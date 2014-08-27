require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:john_doe)
    session[:user_id] = @user.id
  end

  test "should get edit" do
    get :edit, { id: @user.id }
    assert_response :success
  end

  test "should redirect to root when unauthorized edit" do
    get :edit, { id: @user.id }, { user_id: users(:mal_icious).id }
    assert_redirected_to root_url
    assert_equal 'You are not allowed to edit this profile.', flash[:alert]
  end

  test "should update user" do
    patch :update, { id: @user.id, user: { nickname: 'alphabeta24' } }
    assert_redirected_to edit_user_url(@user.id)
    assert_equal 'Profile successfully updated!', flash[:notice]
    assert_equal 'alphabeta24', @user.reload.nickname
  end

  test "should redirect to root when unauthorized update" do
    patch :update, { id: @user.id, user: { nickname: 'alphabeta24' } }, { user_id: users(:mal_icious).id }
    assert_redirected_to root_url
    assert_equal 'You are not allowed to edit this profile.', flash[:alert]
  end

end
