require 'test_helper'

class RequestsControllerTest < ActionController::TestCase
  def setup
    @user = users(:john_doe)
    session[:user_id] = @user.id
  end

  test "should get index" do
    xhr :get, :index
    assert_response :success
  end

  test "should create request" do
    assert_difference('Request.count', 1) do
      xhr :post, :create, { requested_id: users(:emma_smith).id }
    end
    assert_response :success
  end

  test "should accept request" do
    assert_difference('Request.count', -1) do
      assert_difference('Friendship.count', 2) do
        xhr :patch, :update, { id: requests(:first_request).id }
      end
    end
    assert_response :success
  end

  test "should decline request" do
    assert_difference('Request.count', -1) do
      assert_no_difference('Friendship.count') do
        xhr :delete, :destroy, { id: requests(:first_request).id }
      end
    end
  end

end
