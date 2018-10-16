class MessagesController < ApplicationController
 
 before_action :get_messages

 def index 
  unless Membership.where(group_id: @group.id, user_id: current_user.id).exists?
    @group.users << current_user
  end
 	@messages = @group.messages.limit(100)
 end 

 

  private

  	def get_messages
        @group = Group.find(params[:group_id])
        @message = @group.messages.build(user_id: current_user.id)
  	end 

    def render_message(message)
    	render(partial: 'message', locals: { message: message })
    end

    
end
