class BookGroupsController < ApplicationController

	def index 
		@groups = Group.where(book_id: params[:book_id]).all
	end 

	def new 
		@group = Group.new
	end 

	def show
		redirect_to url_for(controller: :messages, action: :index, contr: "book_groups", id: params[:id])
	end 

	def create
		group = Group.new(group_params)
		if group.save
			flash[:notice] = "The group was created"
			book_id = group[:book_id]
			group_id = group[:id]
			Group.create!(book_id: params[:book_id])
			Membership.create!(user_id: current_user.id, group_id: group_id)
		else
			flash[:notice] = "The group wasn't created, try again later"
		end
		redirect_to book_path(params[:book_id])

	end 

	def destroy
		book_id = params[:book_id].to_i
		Group.where(book_id: book_id).destroy_all
	end

	private

	def group_params 
		params.require(:group).permit(:name, :book_id)
	end 
end
