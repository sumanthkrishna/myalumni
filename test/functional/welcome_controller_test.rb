require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  test "should get index" do
    get "index"
    assert_response :success
  end
  
  test "should redirect to alumni page" do
    login_as "harry@gmail.com"
    get "index"
    assert_redirected_to alumni_path(session[:alumni])
  end  
  
  test "should logot and redirect to index page" do
    login_as "harry@gmail.com"
    get "logout"
    assert_nil session[:alumni]
    assert_redirected_to :action => "index"
  end  
  
end
