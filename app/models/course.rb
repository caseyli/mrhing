class Course < ActiveRecord::Base
  attr_accessible :name
  
  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false }
                    
  has_many :registrations
  has_many :users, :through => :registrations
end
