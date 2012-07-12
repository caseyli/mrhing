class Registration < ActiveRecord::Base
  attr_accessible :approved, :course_id, :user_id
  
  belongs_to :course
  belongs_to :user
end
