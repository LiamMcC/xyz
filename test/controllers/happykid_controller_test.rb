require 'test_helper'

class HappykidControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get happykid_home_url
    assert_response :success
  end

  test "should get contact" do
    get happykid_contact_url
    assert_response :success
  end

end
