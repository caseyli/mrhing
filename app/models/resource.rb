class Resource < ActiveRecord::Base
  attr_accessible :description, :file, :name, :course_id
  belongs_to :course
  
  mount_uploader :file, ResourceUploader
  
end
