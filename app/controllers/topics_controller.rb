class TopicsController < ApplicationController
  
  before_filter :load_course
  before_filter :authenticate
  before_filter :deny_access_for_non_approved_students
  before_filter :deny_access_for_non_admins, only: [:edit, :destroy, :update]
  
  def index
    @topics = @course.topics

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @topics }
    end
  end

  def show
    @topic = @course.topics.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  def new
    @topic = @course.topics.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  def edit
    @topic = @course.topics.find(params[:id])
    @course = @topic.course
  end

  def create
    @topic = @course.topics.build(params[:topic])

    respond_to do |format|
      if @topic.save
        format.html { redirect_to course_topics_path(@course), notice: 'Topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @topic = @course.topics.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic.course, notice: 'Topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = @course.topics.find(params[:id])
    @course = @topic.course
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to @course }
      format.json { head :no_content }
    end
  end
  
  private
    def load_course
      @course = Course.find(params[:course_id])
    end
end
