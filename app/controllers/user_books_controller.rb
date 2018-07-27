class UserBookController < ApplicationController
	def create 
		UserBook.create!(book_id: params[:book_id], user_id: current_user.id)
	end

	def destroy
		UserBook.find_by(book_id: params[:book_id], user_id: current_user.id).destroy
	end
end