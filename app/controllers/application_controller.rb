class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  add_breadcrumb "Front Page", :root_path

  def after_sign_in_path_for(user)
    courses_path
  end

  def after_sign_out_path_for(user)
    root_path
  end

  def color_change
    ['blue', 'orange', 'green', 'red', 'purple', 'teal'].sample
  end

  def access_rights
    if logged_in?
      if !admin_or_instructor?
        render text: 'Permissions error!'
      end
    end
  end

  # This method does two things: returns a boolean and redirects visitor to login
  def logged_in?
    if current_user.nil?
      redirect_to new_user_session_path
      return false
    end
  end

  def admin_or_instructor?
    return current_user.is_admin? || current_user.is_instructor?
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit(:first_name, :last_name, :email, :password) 
      end
      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit(:first_name, :last_name, :email, :password, :current_password)
      end
    end
end
