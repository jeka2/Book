class UsersController < ApplicationController
  def show
  	@user_id = params[:id] || current_user.id
  	@user = User.where(id: @user_id)
    @books = current_user.books.all
  end

  def edit
	@user_id = params[:id] || current_user.id
  	@user = User.where(id: @user_id)
  end 

  private

  def user_params
    params.require(:user).permit(:email,:password,:first_name,:last_name, :avatar)
  end
end
