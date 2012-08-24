class DiscussionPostObserver < ActiveRecord::Observer
  
  def after_create(model)
    parent_post = model.parent
    
    if !parent_post.nil? && !parent_post.posted_by_email.nil?
      original_post_user = User.find_by_email(parent_post.posted_by_email)
      
      if original_post_user.email != model.posted_by_email
        NotificationsMailer.response_to_your_post(original_post_user, parent_post, model).deliver
      end
    end
  end  
end
