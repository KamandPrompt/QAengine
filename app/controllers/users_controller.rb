class UsersController < ApplicationController

	before_action :authorize, except: [:signup, :index, :create]

	def index
		@posts = Post.all.order("created_at" => "DESC")
		@post = current_user.posts.build if logged_in?
		@comment = current_user.comments.build if logged_in?
	end

	def signup
		if logged_in?
			redirect_to current_user
		else
			@user = User.new
		end
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

	def show
		@posts = current_user.posts
		@comment = current_user.comments.build if logged_in?
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	    if @user.update_attributes(user_params)
	    	redirect_to current_user
	    else
	    	redirect_to :back
	    end

	end

	def user_params
    	params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :profile_picture)
	end

end
