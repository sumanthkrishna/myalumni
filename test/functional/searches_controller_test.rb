require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  test "should pick course, university & year" do
    session[:register_alumni_id] = 4
    post :create => {
      "commit"=>"Choose", 
      "search"=>{
        "university_id"=>"298486374", 
        "year"=>"2008", 
        "course_id"=>"298486374"}
        }
    assert_redirected_to :controller => "welcome"
  end   
  
  test "get searches page" do
    login_as "harry@gmail.com"
    get :index
    assert_not_nil assigns(:searches).size
    assert_response :success
  end  
  
  test "do search page" do
    login_as "harry@gmail.com"
    xhr :post,:do_now,{"course"=>"--select--","university"=>"2053932785", "year"=>"--select--"}
    assert_not_nil assigns(:searches).size
    assert_response :success
  end  
end
