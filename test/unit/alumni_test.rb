require 'test_helper'

class AlumniTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "login success" do
    assert_not_nil Alumni.login(:email => "harry@gmail.com",:password =>"demo")
  end
  
  test "login failed" do
    assert_nil Alumni.login(:email => "someone",:password =>"demo")  
  end  
  
  test "create alumni" do
    alumni = Alumni.new(:name=>"someone",:email => "new@aol.com",:password => "demo")
    assert_equal alumni.save, true
  end  
  
  
end
