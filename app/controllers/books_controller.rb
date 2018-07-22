class BooksController < ApplicationController
	before_action :load_user

	def index 
		
	end
	
  	def show
  		@book = Book.find(params[:id])
  		@groups = Group.where(user_id: @book.id)
  		@author = Author.find_by(id: @book.author_id)
  	end

  	private 

  	def load_user
		@user = (User.find(params[:user_id]) if params[:user_id]) || current_user
		@books = @user ? @user.books : Book.all.order(name: :desc)
	end 
end
