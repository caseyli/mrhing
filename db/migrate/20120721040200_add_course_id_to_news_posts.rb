class AddCourseIdToNewsPosts < ActiveRecord::Migration
  def change
    add_column :news_posts, :course_id, :integer
  end
end
