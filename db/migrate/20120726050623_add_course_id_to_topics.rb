class AddCourseIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :course_id, :integer
  end
end
