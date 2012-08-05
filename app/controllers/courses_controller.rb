class CoursesController < ApplicationController
  
  before_filter :authenticate
  before_filter :deny_access_for_non_approved_students, except: [:index, :new, :create, :register_current_user]
  before_filter :deny_access_for_non_admins,  only: [:new, :edit, :create, :update, :destroy, :add_teacher, :remove_teacher]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    
    redirect_to courses_url
  end
  
  def register_current_user
    @course = Course.find(params[:id])
    @course.users << current_user
    if @course.save
      flash[:success] = "You have successfully registered. However, you will have to wait until your registration is approved."
    else
      flash[:error] = "There has been an error in registering you for the course."
    end
    redirect_to courses_path
  end
  
  def add_teacher
    teacher = User.find_by_id(params[:teacher_to_add][:id])
    course = Course.find(params[:id])
    course.add_teacher(teacher)
    redirect_to course
  end
  
  def remove_teacher
    teacher = User.find_by_id(params[:teacher_to_remove])
    course = Course.find(params[:id])
    course.remove_host(teacher)
    redirect_to course
  end
  
  private
    def deny_access_for_non_approved_students
      @course = Course.find(params[:id])
      if !admin? && !current_user.approved_courses.include?(@course)
        flash[:error] = "You are not an approved, registered student of the course you're trying to view."
        redirect_to root_path 
      end
    end
end
