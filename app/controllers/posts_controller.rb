class PostsController < ApplicationController
	layout 'admin'
	if session[:id]== null
		session[:id] = 7
		session[:username] = 'anonymous'
	end
	def index
		@allposts = Post.joins(:user).includes(:comments)
		@allposts.each do |x|
			'puts user'
			puts x.user.username
			x.comments.each do |comment|
				puts comment.user.username
			end
		end
	end
	def show
		@myposts = Post.where('user_id' => session[:id]).joins(:user).includes(:comments)
		render 'posts/mine'
	end
	def create
		@newpost = Post.new(post_params)
		@newpost.user_id = session[:id]
		if @newpost.valid?
			@newpost.save
		else 
		 	flash[:errors] = @newpost.errors.messages
		end
		redirect_to '/posts/index'
	end
	def post_params
		params.require(:newpost).permit(:title, :content)
	end
end
