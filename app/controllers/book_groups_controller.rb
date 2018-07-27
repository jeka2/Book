class BookGroupsController < ApplicationController

	def index 
		book_id = params[:book_id]
		@groups =  BookGroup.where(book_id: book_id).all
		p "index"
		p helpers.extractor(@groups)
	end 

	def new 
		@group = Group.new
	end 

	def show

	end 

	def create
		group = Group.new(group_params)
		if group.save
			flash[:notice] = "The group was created"
			book_id = group[:book_id]
			group_id = group[:id]
			BookGroup.create!(book_id: book_id, group_id: group_id)

			redirect_to book_book_groups_path, method: :get
		else
			flash[:notice] = "The group wasn't created, try again later"
		end

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
