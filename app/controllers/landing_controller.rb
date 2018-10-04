class LandingController < ApplicationController
  def index
  	@user = User.first
  end
end
