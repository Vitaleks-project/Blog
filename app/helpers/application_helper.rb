module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def banned
    if(user_signed_in?)
      if(current_user.banned == true)
        return true
      else
        return false
      end
    end
  end
end
