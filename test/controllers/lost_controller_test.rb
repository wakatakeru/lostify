require 'test_helper'

class LostControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get lost_new_url
    assert_response :success
  end

  test "should get index" do
    get lost_index_url
    assert_response :success
  end

end
