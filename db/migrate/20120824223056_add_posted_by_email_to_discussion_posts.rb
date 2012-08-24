class AddPostedByEmailToDiscussionPosts < ActiveRecord::Migration
  def change
    add_column :discussion_posts, :posted_by_email, :string
  end
end
