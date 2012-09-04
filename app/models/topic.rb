class Topic < ActiveRecord::Base
  default_scope order("updated_at desc")
  attr_accessible :title, :course_id, :discussion_posts_attributes
  belongs_to :course
  has_many :discussion_posts, dependent: :destroy
  
  accepts_nested_attributes_for :discussion_posts
end
