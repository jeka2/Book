class BookGroupsController < ApplicationController

	def index 
		@groups = Group.where(book_id: params[:book_id]).all
	end 

	def new 
		@group = Group.new
	end 

	def show
		@group = Group.find(params[:id])
		cache = ActiveSupport::Cache::MemoryStore.new
		p cache.write('city', "Fort Wayne")
		p cache.read('city')
	end 

	def create
		group = Group.new(group_params)
		if group.save
			flash[:notice] = "The group was created"
			book_id = group[:book_id]
			group_id = group[:id]
			Group.create!(book_id: book_id)

			redirect_to book_path(params[:book_id])
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
