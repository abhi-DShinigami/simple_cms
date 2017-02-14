require 'test_helper'

class AdminUsersContollerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_contoller_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_users_contoller_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users_contoller_edit_url
    assert_response :success
  end

  test "should get delete" do
    get admin_users_contoller_delete_url
    assert_response :success
  end

end
