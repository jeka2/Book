class PrivacyController < ApplicationController
	def create 
		@user = User.find(params[:user_id])
		@user.update!(private: 1)
	end 

	def destroy 
		@user = User.find(params[:id])
		@user.update!(private: 0)
	end 
end