class CommentsController < ApplicationController
	def create
		@newcomment = Comment.new(comment_params)
		if session[:id]
			@newcomment.user_id = session[:id]
		else
			@newcomment.user_id = 9
		end
		@newcomment.post_id = params[:id]
		if @newcomment.valid?
			@newcomment.save
		else 
		 	flash[:errors] = @newcomment.errors.messages
		end
		redirect_to '/posts/index'
	end
 	def comment_params
		params.require(:newcomment).permit(:message)
	end
end
