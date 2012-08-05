class CreateTaughtCoursesTeachersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :taught_courses_teachers, :id => false do |t|
      t.integer :taught_course_id
      t.integer :teacher_id
    end
  end

  def self.down
    drop_table :taught_courses_teachers
  end
end
