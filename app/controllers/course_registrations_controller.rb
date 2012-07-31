class CourseRegistrationsController < ApplicationController
  
  before_filter :deny_access_for_non_admins
  
  def index
    @course_registrations = CourseRegistration.all
  end
  
  def approve
    course_registration = CourseRegistration.find(params[:id])
    course_registration.approved = true
    if course_registration.save
      flash[:success] = "Registration successfully approved."
    else
      flash[:error] = "There was an error in approving the registration."
    end

    redirect_to course_registrations_path
  end
  
  def destroy
    course_registration = CourseRegistration.find(params[:id])
    course_registration.destroy
    
    redirect_to course_registrations_path
  end
end