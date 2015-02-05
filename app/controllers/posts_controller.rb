class PostsController < ApplicationController
	layout 'admin'
	def index
		# sql = 	"SELECT a.username as usercomment, m.username as userpost, p.title as posttitle, p.content as pcontent, p.created_at as postdate, c.created_at as commentdate, c.message as commentmsg, p.id as postid, c.id as commentid
		# 		FROM posts p
		# 		LEFT JOIN comments c ON (p.id = c.post_id) 
		# 		LEFT JOIN users a ON (p.user_id = a.id)
 	# 			LEFT JOIN users m ON (c.user_id = m.id)
 	# 			ORDER BY postid desc, commentid desc"
		# @all = ActiveRecord::Base.connection.execute(sql)
		@allposts = Post.joins(:user).includes(:comments)
		@allposts.each do |x|
			'puts user'
			puts x.user.username
			x.comments.each do |comment|
				puts comment.user.username
			end
		end
		# @allcomments = Post.includes(:comments)
		# @allcomments.each do |x|
		# 	'puts comment'
		# 	puts x
		# end
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
