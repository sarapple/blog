class UsersController < ApplicationController
	def main
		@allUsers = User.all
	end
	def create
		@newUser = User.new (user_params)
		if @newUser.valid?
			@newUser.save
		else 
		 	flash[:errors] = @newUser.errors.messages
		end
		redirect_to '/'
	end
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
