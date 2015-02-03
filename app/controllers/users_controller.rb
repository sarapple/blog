class UsersController < ApplicationController
	def main
		@allUsers = User.all
	end
	def create
		@newUser = User.new (user_params)
		@newUser.save!
		rescue ActiveRecord::RecordInvalid
		logger.error($!.to_s)
		redirect to '/'
	end
	def user_params
		params.require(:user).permit(:username, :password, :email)
	end
end
