class NewsPost < ActiveRecord::Base
  default_scope order("updated_at desc")
  attr_accessible :body, :title, :course_id
  belongs_to :course
end
