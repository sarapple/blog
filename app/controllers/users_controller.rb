class UsersController < ApplicationController
	def main
		@allUsers = User.all
	end
	def create
		@newUser = User.new (user_params)
		@newUser.valid?
		if @newUser.errors
			flash[:errors] = @newUser.errors.messages
		else 
			@newUser.save
		end
		redirect_to '/'
	end
	def user_params
		params.require(:user).permit(:username, :password, :email)
	end
end
