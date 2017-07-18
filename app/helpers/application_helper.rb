module ApplicationHelper
	def logged_in?
		if session[:user] == nil
			return false
		else
			return true
		end
	end

	def current_user 
  		return session[:user]
	end
end
