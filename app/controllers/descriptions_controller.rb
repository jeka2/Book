class DescriptionsController < ApplicationController
	
	def create
		user = User.find(params[:user_id])
		new_description = params[:post][:description]
		user.update!(description: new_description)
	end

	def update
		user = User.find(params[:id])
		updated_description = params[:user][:description]
		user.update!(description: updated_description)
		if params[:user][:updated] 
			respond_to do |format|
				request.format = :js
				format.html { redirect_to root_path }
				format.js { redirect_to description_button_path(:updated => true) }
			end
		end
	end


end