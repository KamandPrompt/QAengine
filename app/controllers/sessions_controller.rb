class SessionsController < ApplicationController


	def login
		@user = User.find_by(username: params[:session][:username] )
		byebug
		if @user && @user.authenticate(params[:session][:password])
			log_in @user
			redirect_to @user
		else
			puts "Wrong credentials! Enter Again "
			render 'signup'
		end	
	end


	def destroy
		log_out
		redirect_to root_path
	end

end
