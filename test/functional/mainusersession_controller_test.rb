require 'test_helper'
 class MainusersessionsControllerTest < ActionController::TestCase

 test "should get new" do
    get :new
    assert_response :success
 end
 test "should login" do
    dave = mainusers(:one)
    post :create, :name => dave.name, :password => 'secret'
    assert_redirected_to mainuserpage_url
    assert_equal dave.id, session[:user_id]

 test "should fail login" do
    dave = mainusers(:one)
    post :create, :name => dave.name, :password => 'wrong'
    assert_redirected_to userlogin_url
 end
test "should logout" do
   delete :destroy
   assert_redirected_to store_url
end
   end
 end