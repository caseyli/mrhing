class CourseRegistrationsController < ApplicationController
  
  before_filter :load_course_and_course_registration, except: [:index]
  before_filter :deny_access_for_non_admins_and_non_teachers_of_this_course, except: [:index]
  before_filter :deny_access_for_non_admins_and_non_teachers, only: [:index]
  
  def index
    @course_registrations = CourseRegistration.all
    @course_registrations.sort! {|x,y| x.user.first_name <=> y.user.first_name}
  end
  
  def approve
    @course_registration.approved = true
    if @course_registration.save
      flash[:success] = "Registration successfully approved."
    else
      flash[:error] = "There was an error in approving the registration."
    end

    redirect_to course_registrations_path
  end
  
  def destroy
    @course_registration.destroy
    redirect_to course_registrations_path
  end
  
  private
    def load_course_and_course_registration
      @course_registration = CourseRegistration.find(params[:id])
      @course = @course_registration.course
    end
end