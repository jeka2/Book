class PrivacyController < ApplicationController
	def create 
		@user = params[:id]
		p params
	end 

	def destroy 

	end 
end