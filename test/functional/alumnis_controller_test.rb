require 'test_helper'

class AlumnisControllerTest < ActionController::TestCase
  test "should get new" do
    xhr :get,:new
    assert_response :success
  end
  
  test "should post register step1" do
    post :create,{"commit"=>"Create",
     "alumni"=>{
        "name"=>"sample", 
        "password_confirmation"=>"demo", 
        "password"=>"demo", 
        "email"=>"sample@gmail.com"
        }
      }    
    assert_redirected_to new2_alumnis_path    
  end
  
  test "should get register step 2" do
    get :new2
    assert_response :success
  end  
  
  test "should get login" do
    xhr :get,:login
    assert_response :success
  end  
  
  test "should login successfully" do
    xhr :post,:do_login,{"password"=>"demo", "email"=>"harry@gmail.com"}
    assert_not_nil assigns(:alumni)
    assert_redirected_to alumni_path(:id => 2053932786)
  end 
  
  test "should be wrong login" do 
    xhr :post,:do_login,{"password"=>"demo", "email"=>"hallo@gmail.com"}
    assert_redirected_to :controller => :welcome
  end  
  
  test "should get my profile page" do
    login_as "harry@gmail.com"
    get :show,:id => 2053932786
    assert_not_nil assigns(:alumni)
    assert_response :success
  end  
end
