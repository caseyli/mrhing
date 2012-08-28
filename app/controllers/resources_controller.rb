class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  before_filter :load_course
  before_filter :authenticate
  before_filter :deny_access_for_non_approved_students
  before_filter :deny_access_for_non_admins_and_non_teachers_of_this_course, only: [:new, :edit, :create, :destroy, :update]
  
  def index
    @resources = @course.resources

    @resources.sort! { |r| r.category }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  def show
    @resource = @course.resources.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = @course.resources.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = @course.resources.find(params[:id])
    @course = @resource.course
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = @course.resources.build(params[:resource])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to course_resources_path(@resource.course), notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = @course.resources.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to course_resources_path(@resource.course), notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = @course.resources.find(params[:id])
    @course = @resource.course
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to course_resources_path(@course) }
      format.json { head :no_content }
    end
  end
  
  private
    def load_course
      @course = Course.find(params[:course_id])
    end
end
