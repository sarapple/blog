class UsersController < ApplicationController
	def main
		@allUsers = User.all
	end
	def create
		@newUser = User.new (reg_params)
		if @newUser.valid?
			@newUser.save
		else 
		 	flash[:errors] = @newUser.errors.messages
		end
		redirect_to '/'
	end
	def login
		@returnUser = User.new (login_params)
		puts params[:returnUser]['username']
		puts params[:returnUser]['password']
		result = User.find_by(username: params[:returnUser]['username']).try(:authenticate, params[:returnUser]['password']) 
		if result 
			session[:id] = result.id
			session[:username] = result.username
			redirect_to "/posts/index"
		end
	end
	def reg_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
	def login_params
		params.require(:returnUser).permit(:username, :password)
	end
end
