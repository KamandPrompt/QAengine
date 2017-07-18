class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user 
  	return User.find_by(id: session[:user]["id"])
  end

  def authorize 
  	if current_user == nil
  	  	redirect_to root_path
  	end
  end

  def logged_in?
    if session[:user] == nil
      return false
    else
      return true
    end
  end

end
