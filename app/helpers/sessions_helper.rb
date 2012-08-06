module SessionsHelper
  def admin?
    if current_user.nil?
      false
    else
      current_user.is_admin?
    end
  end
  
  def teacher?
    if current_user.nil?
      false
    else
      current_user.is_teacher?
    end
  end
  
  def teacher_of?(course)
    if current_user.nil?
      false
    else
      current_user.is_teacher_of?(course)
    end
  end
end