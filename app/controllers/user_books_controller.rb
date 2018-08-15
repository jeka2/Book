class UserBooksController < ApplicationController
	before_action :load_user

	def create 
		current_user.books << Book.find(params[:id])
	end

	def destroy
		Collection.where(book_id: @book_id, user_id: @user_id).destroy_all
	end

	private

	def load_user
		@user_id = current_user.id
		@book_id = params[:id]
	end 
end