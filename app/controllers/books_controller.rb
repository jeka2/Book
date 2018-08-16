class BooksController < ApplicationController
	before_action :load_user

	def index 
		
	end
	
  	def show
      @book = Book.find(params[:id])
      @groups =  Group.where(book_id: @book.id).all
  		@group = Group.where(user_id: @user.id)
  		@author = Author.find_by(id: @book.author_id)
  		@subscribed = Collection.where(book_id: @book.id, user_id: @user.id).exists?
  	end

  	private 

  	def load_user
		@user = (User.find(params[:user_id]) if params[:user_id]) || current_user
		@books = @user ? @user.books.order(name: :desc) : Book.all.order(name: :desc)
	end 
end
