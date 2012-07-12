class RegistrationsController < ApplicationController
  
  before_filter :deny_access_for_non_admins
  
  def index
    @registrations = Registration.all
  end
  
  def approve
    registration = Registration.find(params[:id])
    registration.approved = true
    if registration.save
      flash[:success] = "Registration successfully approved."
    else
      flash[:error] = "There was an error in approving the registration."
    end

    redirect_to registrations_path
  end
end