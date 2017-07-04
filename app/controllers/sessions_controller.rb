class SessionsController < ApplicationController
	def create_session
		
		@user = User.find_by(username: params[:username] )
		
		if @user && @user.authenticate(params[:password])
			log_in @user
			redirect_to root_path
			
		else
			puts "Wrong credentials! Enter Again "
			render 'signup'
		end	
	end

	def login
		@user = User.new
	end


	def destroy
		log_out
		redirect_to root_path
	end

end
