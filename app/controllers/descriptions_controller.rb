class DescriptionsController < ApplicationController
	
	def create
		@user = User.find(params[:user_id])
		new_description = params[:post][:description]
		@user.update!(description: new_description)
	end

	def update
		@user = User.find(params[:id])
		updated_description = params[:user][:description]
		@user.update!(description: updated_description)
		
	end


end