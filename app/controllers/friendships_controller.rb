class FriendshipsController < ApplicationController
  def create
  	potential_friend = User.find(params[:id])
  	friendship = current_user.friend_request(potential_friend) 
	  if @friendship.save
	    flash[:notice] = "Friend request sent."
	  else
	    flash[:error] = "Unable to request friendship."
	  end
  end

  def update
  	friend_id = params[:id]
  	@friendship = Friendship.find_by(user_id: friend_id, friend_id: current_user.id)
	  @friendship.update(accepted: true)
	  if @friendship.save
	    flash[:notice] = "Successfully confirmed friend!"
	  else
	    flash[:notice] = "Sorry! Could not confirm friend!"
	  end
	  redirect_to :root_path
  end

  def destroy
  	friend_id = params[:id]
  	@friendship = Friendship.find_by(user_id: current_user.id, friend_id: friend_id)
	  if @friendship.destroy
	  	flash[:notice] = "Removed friendship."
	  else
	  	flash[:notice] = "Unable to remove friendship, please try again later."
	  end
  end

  def decline
  	declined_user_id = params[:user_id]
  end

  def panel
  	@friendship = Friendship.find_by(user_id: current_user, friend_id: params[:id])
  end

end
