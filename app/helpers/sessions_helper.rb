module SessionsHelper
	def log_in(user)
		session[:user] = user
	end

	def log_out
		session.delete(:user)
		@current_user = nil
	end
end
