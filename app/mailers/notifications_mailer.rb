class NotificationsMailer < ActionMailer::Base
  default from: "noreply@mrhing.com"
  
  def user_registered_for_course(user, course, teachers)
    @course = course
    @user = user
    @teachers = teachers
    
    teachers_emails = @teachers.collect {|t| t.email}
    
    mail(:to => teachers_emails.join(", "),
           :subject => "A Student has Registered for a Course")
    
  end
  
  def user_approved_for_course(user, course)
    @course = course
    @user = user
    
    mail(:to => user.email,
         :subject => "Your registration has been approved!")
    
  end
  
end
