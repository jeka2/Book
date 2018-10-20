class AdministrativeController < ApplicationController
	before_action :authenticate_admin!

	def index
		@active_bans = Ban.all
	end

	def create
		User.find(params[:user_id]).admin!
	end

	def destroy
		User.find(params[:user_id]).standard!
	end

	private

	def authenticate_admin!
		unless current_user.admin?
			flash[:notice] = "You do not have the privilege to perform this action"
			redirect_to root_path
		end
	end

	def ban_parameters
		params.require(:ban).permit(:ids => [])
	end

end