module DiscussionPostsHelper
  
  def nested_discussion_posts(discussion_posts)
    discussion_posts.map do |discussion_post, sub_discussion_posts|
      render(discussion_post) + content_tag(:div, nested_discussion_posts(sub_discussion_posts), :class => "nested-discussion-posts" )
    end.join.html_safe
  end
  
end
