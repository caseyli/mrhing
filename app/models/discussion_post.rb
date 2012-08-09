class DiscussionPost < ActiveRecord::Base
  default_scope order("updated_at desc")
  attr_accessible :body, :posted_by, :topic_id, :parent_id
  belongs_to :topic
  
  has_ancestry
end
