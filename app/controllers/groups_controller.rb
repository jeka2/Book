class GroupsController < ApplicationController
	def index
		@groups = Group.all
	end 

	def new 
		@group = Group.new
	end 

	def create
		group = Group.build(group_params)
		if group.save
			redirect_to group
		else 
			flash[:notice] = "There was an error creating the group, please try again!"
			redirect_to :index
		end
	end 

	private

	def group_params 
		unless params[:user_id]
			params.require(:group).permit(:name, :book_id)
		else 
			params.require(:group).permit(:name, :user_id)
		end
	end 
end