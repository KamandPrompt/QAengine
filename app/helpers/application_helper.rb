module ApplicationHelper
	def logged_in?
		if session[:user] == nil
			return false
		else
			return true
		end
	end

	def current_user 
	  	@current_user ||= User.find_by(id: session[:user]["id"])
	end
end
