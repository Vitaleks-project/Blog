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

  def current_user_has_vote?
    current_voting =  Voting.find_last_by_current(true)
    current_voting_targets_admin = Target.where(admin_id: current_admin.id, voting_id: current_voting.id) if admin_signed_in?
    current_voting_targets_user = Target.where(user_id: current_user.id, voting_id: current_voting.id) if user_signed_in?

    if(current_voting_targets_admin || current_voting_targets_user).present?
      return false
    else
      return true
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

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + 's', :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end
end
