class SubscribeController < ApplicationController
	def create
		p "-----"
		book = Book.find(params[:book_id])
		current_user.books.update_attributes(subscribed: true).save
		p current_user.where(book_id: book.id)
		p "-----"
	end

	def destroy
		book = Book.find(params[:book_id])
		user_book = current_user.books.find_by(name: book.name)
		user_book.update_attributes(subscribed: true)
		user_book.save
	end
end