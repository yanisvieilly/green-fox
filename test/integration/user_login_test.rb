require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def omniauth_flow
    get login_url
    assert_response :success

    get '/auth/twitter'
    follow_redirect!

    assert_equal '/auth/twitter/callback', path
    follow_redirect!
  end

  test "should be able to log in with valid credentials" do
    existing_user = {
      provider: 'twitter',
      uid: users(:john_doe).uid
    }
    OmniAuth.config.add_mock(:twitter, existing_user)

    omniauth_flow

    assert_equal root_path, path
    assert_equal "Welcome back, #{users(:john_doe).name}!", flash[:notice]
  end

  test "should not be able to log in with invalid credentials" do
    OmniAuth.config.mock_auth[:twitter] = :invalid_credentials

    omniauth_flow

    assert_equal auth_failure_path, path
    assert_equal "Login error: invalid_credentials", flash[:alert]
  end
end
