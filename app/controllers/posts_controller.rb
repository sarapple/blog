class PostsController < ApplicationController
	layout 'admin'
	def index
		@allposts = Post.select("username", "posts.id", "created_at", "title", "content").joins(:user)
		puts @allposts
	end
	def create
		@newpost = Post.new(post_params)
		@newpost.user_id = session[:id]
		@newpost.save
		redirect_to '/posts/index'
	end
	def post_params
		params.require(:newpost).permit(:title, :content)
	end
end
