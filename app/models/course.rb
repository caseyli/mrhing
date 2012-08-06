class Course < ActiveRecord::Base
  attr_accessible :name
  
  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }
                    
  has_many :course_registrations, dependent: :destroy
  has_many :users, :through => :course_registrations
  has_many :news_posts, dependent: :destroy
  has_many :topics, dependent: :destroy
  
  has_and_belongs_to_many :teachers, :class_name => "User", 
                          :join_table => "taught_courses_teachers",
                          :foreign_key => "taught_course_id",
                          :association_foreign_key => "teacher_id"
                          
  def add_teacher(teacher)
    teachers << teacher if teacher.is_teacher?
    update
  end

  def remove_teacher(teacher)
    teachers.delete(teacher)
    update
  end
end
