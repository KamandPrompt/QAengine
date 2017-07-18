class PostsController < ApplicationController

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def destroy
		@post = current_user.posts.find_by(params[:id])
		@post.destroy
		redirect_to :back
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end
