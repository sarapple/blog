class UsersController < ApplicationController
	def main
		@allUsers = User.all
	end
	def create
		@newUser = User.new (user_params)
		@newUser.save!
		puts *********
		puts @newUser.to_s
		puts *********
		rescue ActiveRecord::RecordInvalid
		logger.error($!.to_s)
		redirect 'users/main'
	end
	def user_params
		params.require(:user).permit(:username, :password, :email)
	end
end
