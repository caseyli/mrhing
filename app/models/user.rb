class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :student_number,
                  :password, :password_confirmation, :remember_me


  has_and_belongs_to_many :roles
  
  def is_admin?
    roles?(:admin)
  end
  
  def make_admin
    add_role("admin") unless is_admin?
  end
  
  def roles?(role)
      self.roles.include?(Role.find_by_name(role))
  end
  
  def add_role(role)
    self.roles << Role.find_by_name(role)
  end
  
end
