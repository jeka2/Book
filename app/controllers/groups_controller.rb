class GroupsController < ApplicationController
	def index
		if params[:book_id]
			@book = params[:book_id]
			@groups = Group.where(book_id: params[:book_id]).order('created_at DESC')
		else 
			@groups = Group.where(user_id: params[:user_id]).order('created_at DESC')
		end
	end 

	def new 
		@group = Group.new
		if params[:book_id]
			@group = Group.new(book_id: params[:book_id])
		end
	end 

	def create
		group = Group.new(group_params)
		book_id = params[:group][:book_id]
		
		if group.save
			group.update_attributes(subscribed: true)
		else 
			flash[:notice] = "There was an error creating the group, please try again!"
		end
		redirect_to book_groups_path(book_id)
	end 

	def show
		@group = Group.find(params[:id])
		@book = Book.find(params[:book_id])
		p current_user
		p @book
	end

	private

	def group_params 
		unless params[:user_id]
			params.require(:group).permit(:name, :book_id, :subscribed)
		else 
			params.require(:group).permit(:name, :user_id, :subscribed)
		end
	end 
end