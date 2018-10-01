class ChapterGroupsController < ApplicationController

	def index 
		@groups = Group.where(chapter_id: params[:chapter_id]).all
	end 

	def new 
		@group = Group.new
	end 

	def create
		group = Group.new(group_params)
		if group.save
			flash[:notice] = "The group was created"
			group_id = group[:id]
		
			Membership.create!(user_id: current_user.id, group_id: group_id)
		else
			flash[:notice] = "The group wasn't created, try again later"
		end
		redirect_to url_for(controller: :messages, action: :index, group_id: group_id)

	end 

	def destroy
		book_id = params[:book_id].to_i
		Group.where(book_id: book_id).destroy_all
	end

	private

	def group_params 
		params.require(:group).permit(:name, :book_id, :chapter_id)
	end 
end
