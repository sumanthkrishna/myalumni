require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  # Replace this with your real tests.
   #{"course"=>"298486374", "authenticity_token"=>"0UN2CC80BI3nME23rJ13H5iyYamwjd7stAMh9UINx+g=", "university"=>"2053932785", "year"=>"2009"}
  test "the search" do
     assert_not_nil Search.do_now(:course => 298486374, :university => 2053932785, :year => 2009 ).size
  end
end
