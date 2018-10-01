class ChaptersController < ApplicationController

	def show
		@book = Book.find(params[:book_id])
		@chapter = Chapter.find(params[:id])
	end
end