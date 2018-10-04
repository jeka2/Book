class FriendshipsController < ApplicationController
  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
	  if @friendship.save
	    flash[:notice] = "Friend requested."
	  else
	    flash[:error] = "Unable to request friendship."
	  end
  end

  def update
  	@friendship = Friendship.find_by(id: params[:id])
	  @friendship.update(status: "accepted")
	  if @friendship.save
	    flash[:notice] "Successfully confirmed friend!"
	  else
	    flash[:notice] "Sorry! Could not confirm friend!"
	  end
  end

  def destroy
  	@friendship = Friendship.find_by(id: params[:id])
	  @friendship.destroy
	  flash[:notice] = "Removed friendship."
  end
end
