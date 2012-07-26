class AddTopicIdToDiscussionPosts < ActiveRecord::Migration
  def change
    add_column :discussion_posts, :topic_id, :integer
  end
end
