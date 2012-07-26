class CreateDiscussionPosts < ActiveRecord::Migration
  def change
    create_table :discussion_posts do |t|
      t.string :posted_by
      t.text :body

      t.timestamps
    end
  end
end
