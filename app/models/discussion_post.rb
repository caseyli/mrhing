class DiscussionPost < ActiveRecord::Base
  attr_accessible :body, :posted_by, :topic_id, :parent_id
  belongs_to :topic
  
  has_ancestry cache_depth: true
end
