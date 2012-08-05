class CourseRegistrationObserver < ActiveRecord::Observer
  
  def after_create(model)
    # TODO - change this to actually look up the teachers of the course
    teachers = User.find_all_by_email('casey.li@gmail.com')
    user = User.find(model.user_id)
    course = Course.find(model.course_id)
    NotificationsMailer.user_registered_for_course(user, course, teachers).deliver
  end
  
end
