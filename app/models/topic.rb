class Topic < ActiveRecord::Base
  default_scope order("updated_at desc")
  attr_accessible :title, :course_id
  belongs_to :course
  has_many :discussion_posts
end
