class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def signup
		@user = User.new
	end

	def create
		@user = User.new(user_params)
	    if(@user.save)
	  		session[:user] = @user
		    redirect_to root_path
	  	else
	  		redirect_to signup_path
		end
	end


	def user_params
    	params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
	end

end
