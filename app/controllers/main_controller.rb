class MainController < ApplicationController
	before_action :load_user
	before_action :force_json, only: [:autocomplete, :user_autocomplete]

	def search 
		@names = @books.ransack(name_cont: params[:q]).result(distinct: true).order('name ASC')
		@authors = Author.all.ransack(name_cont: params[:q]).result.order('name ASC')
	end 

	def autocomplete 
		@names = @books.ransack(name_cont: params[:q]).result(distinct: true).limit(5).order('name ASC')
		@authors = Author.all.ransack(name_cont: params[:q]).result.limit(5).order('name ASC')
	end 

	def user_search 
		@user = User.where.not(id: current_user.id).ransack(email_cont: params[:q]).result.order('email ASC')
	end

	def user_autocomplete
		@user = User.where.not(id: current_user.id).ransack(email_cont: params[:q]).result.limit(5).order('email ASC')
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