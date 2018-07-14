class BooksController < ApplicationController
	before_action :load_user

	def index 
		
	end
	
  	def show
  		@book = Book.find(params[:id])
  	end

  	private 

  	def load_user
		@user = User.find(params[:user_id]) if params[:user_id]
		@books = @user ? @user.books : Book.all.order(name: :desc)
	end 
end
