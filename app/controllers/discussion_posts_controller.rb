class DiscussionPostsController < ApplicationController
  
  before_filter :load_course_and_topic
  
  def index
    @discussion_posts = @topic.discussion_posts.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @discussion_posts }
    end
  end

  def show
    @discussion_post = @topic.discussion_posts.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @discussion_post }
    end
  end

  def new
    @discussion_post = @topic.discussion_posts.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @discussion_post }
    end
  end

  def edit
    @discussion_post = @topic.discussion_posts.find(params[:id])
  end

  def create
    @discussion_post = @topic.discussion_posts.build(params[:discussion_post])
    @discussion_post.posted_by = current_user.full_name
    respond_to do |format|
      if @discussion_post.save
        format.html { redirect_to course_topic_path(@course, @discussion_post.topic), notice: 'Discussion post was successfully created.' }
        format.json { render json: @discussion_post, status: :created, location: @discussion_post }
      else
        format.html { render action: "new" }
        format.json { render json: @discussion_post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @discussion_post = @topic.discussion_posts.find(params[:id])

    respond_to do |format|
      if @discussion_post.update_attributes(params[:discussion_post])
        format.html { redirect_to @discussion_post, notice: 'Discussion post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @discussion_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussion_posts/1
  # DELETE /discussion_posts/1.json
  def destroy
    @discussion_post = @topic.discussion_posts.find(params[:id])
    @topic = @discussion_post.topic
    @discussion_post.destroy

    respond_to do |format|
      format.html { redirect_to course_topic_path(@course, @topic) }
      format.json { head :no_content }
    end
  end
  
  private
    def load_course_and_topic
      @course = Course.find(params[:course_id])
      @topic = @course.topics.find(params[:topic_id])
    end
end
