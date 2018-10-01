class BooksController < ApplicationController
	before_action :load_books

	def index 
		
	end
	
  	def show
      @book = Book.find(params[:id])
      @chapters = @book.chapters.all
      rating_present = true if @book.rating_count != 0
      @book_rating = rating_present ? (@book.rating / @book.rating_count).round(1) : 0
  		@group = Group.where(user_id: @user.id)
  		@author = Author.find_by(id: @book.author_id)
  		@subscribed = Collection.where(book_id: @book.id, user_id: @user.id).exists?
  	end

  	private 

  	def load_books
		@user = (User.find(params[:user_id]) if params[:user_id]) || current_user
		@books = @user ? @user.books.order(name: :desc) : Book.all.order(name: :desc)
	end 
end
