class Alumni < ActiveRecord::Base
  belongs_to :user
  belongs_to :university
  belongs_to :course
  
  validates_uniqueness_of :course_id, :scope => :university_id
  
  def self.search(parameters)
    conditions = {
      :course_id => parameters[:course],
      :university_id => parameters[:university],
      :year => parameters[:year]
    }
    conditions.reject! {|key,value| value==" "}
    find(:all,:conditions => conditions, :group => 'user_id, university_id')
  end  
end
