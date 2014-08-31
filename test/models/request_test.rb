require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  test "should create a friendship when accepted" do
    requests(:first_request).accept
    assert users(:john_doe).friends.include? users(:jack_three)
  end
end
