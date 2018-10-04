class MembershipsController < ApplicationController

	def create
		unless Membership.where(user_id: params[:user_id], group_id: params[:group_id]).exists?
			
		end
	end

	def destroy

	end
end