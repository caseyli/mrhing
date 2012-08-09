class AddAncestryToDiscussionPosts < ActiveRecord::Migration
  def change
    add_column :discussion_posts, :ancestry, :string
    add_index :discussion_posts, :ancestry
  end
end
