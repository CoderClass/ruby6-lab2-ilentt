class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  def current_user
  	if session[:user_id]
  		return User.find(session[:user_id])
  	end
  	return nil
  end

  def signed_in?
  	if current_user
  		return true
  	else
  		return false
  	end 
  end

  # file: application_helper.rb
def bootstrap_class_for flash_type
  { success: 'alert-success', error: 'alert-danger', notice: 'alert-warning'}[flash_type.to_sym]
end

def flash_messages(opts = {})
  flash.map do |msg_type, message|
    content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade show") do
      content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: 'alert'}) + message
    end
  end.join.html_safe
end

end



