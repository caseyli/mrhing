class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def deny_access_for_non_admins
    if !admin?
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
  
  def deny_access_for_non_admins_and_non_teachers
    if !admin? && !teacher?
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
  
    
  def deny_access_for_non_admins_and_non_teachers_of_this_course
    if !admin? && !teacher_of?(@course)
      flash[:error] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
  
  def deny_access_for_non_approved_students
    @course = Course.find(params[:course_id])
    if !admin? && !current_user.approved_courses.include?(@course)
      flash[:error] = "You are not an approved, registered student of the course you're trying to view."
      redirect_to root_path 
    end
  end
  
  def authenticate
    redirect_to "/users/sign_in" if !user_signed_in?
  end
end
