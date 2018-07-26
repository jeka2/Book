class BookGroupsController < ApplicationController
	def new 
		@group = Group.new
	end 

	def show
		
	end 

	def create
		group_id = params[:group_id]
		book_id = params[:book_id]
		BookGroup.create!(book_id: book_id, group_id: group_id)
	end 

	def destroy
		group_id = params[:id]
		book_id = params[:book_id].to_i
		BookGroup.where(book_id: book_id, group_id: group_id).destroy_all
	end

	private

	def group_params 
		params.require(:group).permit(:name, :book_id)
	end 
end
