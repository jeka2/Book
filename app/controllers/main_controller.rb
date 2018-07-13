class MainController < ApplicationController
	before_action :load_user
	before_action :force_json, only: :autocomplete

	def search 
		@names = @books.ransack(name_cont: params[:q]).result(distinct: true)
		@author = @books.ransack(author_cont: params[:q]).result
	end 

	def autocomplete 
		@names = @books.ransack(name_cont: params[:q]).result(distinct: true).limit(5)
		@author = @books.ransack(author_cont: params[:q])
	end 

	

	private

	def load_user
		@user = User.find(params[:user_id]) if params[:user_id]
		@books = @user ? @user.books : Book.all
	end 

	def force_json
		request.format = :json
	end
end 