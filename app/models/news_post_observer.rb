class NewsPostObserver < ActiveRecord::Observer
  def after_create(model)
    NotificationsMailer.course_news(model).deliver
  end
end
