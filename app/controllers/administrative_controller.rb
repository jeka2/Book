class AdministrativeController < ApplicationController
	before_action :authenticate_admin!

	def index
		p "show"
	end

	def create

	end

	def destroy

	end

	private

	def authenticate_admin!
		unless current_user.admin?
			flash[:notice] = "You do not have the privilege to perform this action"
			redirect_to root_path
		end
	end

end