class UsersController < ApplicationController
  
  before_filter :deny_access_for_non_admins
  
  def index
    @users = User.all
  end
  
  def take_away_admin
    user = User.find(params[:id])
    if current_user != user
      user.roles.delete(user.roles.find_by_name(:admin))
      flash[:success] = "User Successfully updated!"
    else
      flash[:error] = "You can't take away your own Admin privileges"
    end
    
    redirect_to users_path
  end
  
  def make_admin
    user = User.find(params[:id])
    user.make_admin
    flash[:success] = "User Successfully updated!"
    redirect_to users_path
  end
  
end
