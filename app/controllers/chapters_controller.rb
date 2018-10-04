class ChaptersController < ApplicationController

	def show
		@book = Book.find(params[:book_id])
		@chapter = Chapter.find_by(id: params[:id], book_id: @book.id)
		@groups = @chapter.groups.all.order(id: :desc)
	end
end