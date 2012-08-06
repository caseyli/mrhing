class CourseRegistrationObserver < ActiveRecord::Observer
  
  def after_create(model)
    # TODO - change this to actually look up the teachers of the course
    user = User.find(model.user_id)
    course = Course.find(model.course_id)
    teachers = course.teachers
    NotificationsMailer.user_registered_for_course(user, course, teachers).deliver
  end
  
  def after_update(model)
    user = User.find(model.user_id)
    course = Course.find(model.course_id)
    if model.approved
      NotificationsMailer.user_approved_for_course(user, course).deliver
    end
  end
  
end
