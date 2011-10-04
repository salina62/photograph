require 'test_helper'

class MainusersControllerTest < ActionController::TestCase
  setup do
    @input_attributes = {
      :name                  => "sam",
      :password              => "private",
      :password_confirmation => "private"
    }
    @mainuser = mainusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create main user" do
    assert_difference('Mainuser.count') do
      post :create, :mainuser => @input_attributes
    end

    assert_redirected_to mainuser_path
  end

  test "should show main user" do
    get :show, :id => @mainuser.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mainuser.to_param
    assert_response :success
  end

  test "should update main user" do
    put :update, :id => @mainuser.to_param, :mainuser => @input_attributes
    assert_redirected_to mainuser_path
  end

  test "should destroy mainuser" do
    assert_difference('Mainuser.count', -1) do
      delete :destroy, :id => @mainuser.to_param
    end

    assert_redirected_to mainusers_path
  end
end
