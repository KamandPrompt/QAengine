class SessionsController < ApplicationController
	def create_session
		@user = User.find_by(username: params[:username] )
		
		if @user && @user.authenticate(params[:password])
			log_in @user
			redirect_to root_path
			
		else
			puts "Wrong credentials! Enter Again "
			redirect_to :back
		end	
	end

	def login
		if logged_in?
			redirect_to current_user
		else
			@user = User.new
		end

	end


	def destroy
		log_out
		redirect_to root_path
	end

end
