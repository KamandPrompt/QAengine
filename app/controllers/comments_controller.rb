class CommentsController < ApplicationController
	def create
		@comment = current_user.comments.build(comment_params)
		if @comment.save
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def destroy
		@comment = current_user.comments.find(params[:id])
		@comment.destroy
		redirect_to :back
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :post_id)
	end
end
