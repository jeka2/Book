class UsersController < ApplicationController
	before_action :set_user
  	def show
    	@user = User.find(params[:id])
  	end

  	private

  	def user_params
    	params.require(:user).permit(:email,:password,:first_name,:last_name, :avatar)
  	end

  	def set_user 
  		@user_id = params[:id] || current_user.id
  		@user = User.find_by(id: @user_id)
  	end 
end
