require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login" do
    get :new
    assert_response :success
  end

  test "should create unknown user" do
    new_user = {
      provider: 'twitter',
      uid: 444444,
      info: {
        name: 'Jane Doe',
        nickname: 'bluetiger',
        description: 'Two words about me',
        location: 'Long Beach, CA'
      }
    }
    OmniAuth.config.add_mock(:twitter, new_user)
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    assert_difference('User.count') do
      get :create, provider: 'twitter'
    end
    assert_redirected_to root_url
    assert_equal "Welcome back, #{new_user['info']['name']}!", flash[:notice]
  end

  test "should not create known user" do
    existing_user = {
      provider: 'twitter',
      uid: users(:john_doe).uid
    }
    OmniAuth.config.add_mock(:twitter, existing_user)
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
    assert_no_difference('User.count') do
      get :create, provider: 'twitter'
    end
    assert_redirected_to root_url
    assert_equal "Welcome back, #{users(:john_doe).name}!", flash[:notice]
  end

  test "should get logout" do
    get :destroy
    assert_redirected_to login_url
    assert_equal 'Successfully logged out.', flash[:notice]
    assert_nil session[:user_id]
  end

end
