class BooksController < ApplicationController
	before_action :load_user

	def index 
		
	end
	
  	def show
  		@book = Book.find(params[:id])
  		@group = Group.where(user_id: @user.id)
  		@author = Author.find_by(id: @book.author_id)
  		@subscribed = true if UserBook.find_by(user_id: @user.id, book_id: @book.id)
  		p UserBook.find_by(user_id: @user.id, book_id: @book.id)
  		p @subscribed
  	end

  	private 

  	def load_user
		@user = (User.find(params[:user_id]) if params[:user_id]) || current_user
		@books = @user ? @user.books : Book.all.order(name: :desc)
	end 
end
