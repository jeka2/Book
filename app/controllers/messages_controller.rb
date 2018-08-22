class MessagesController < ApplicationController
 
 before_action :get_messages
 helper_method :display_chooser

 def index 
 	@messages = @group.messages.limit(100)
 end 

 def create
   object_to_display = display_chooser(params[:cont], params[:id])
   message = object_to_display.messages.build(message_params)
   message.user_id = current_user.id
    if message.save
      unless current_user.groups.where(id: params[:id]).exists?
        current_user.groups << Group.find(params[:id])
      end
      MessageRelayJob.perform_later(message)
      ActionCable.server.broadcast 'room_channel',
                                   message: render_message(message)
      message.mentions.each do |mention|
      ActionCable.server.broadcast "room_channel_user_#{mention.id}",
                                   mention: true
      end
    end
 end


  private

  	def get_messages
      if params[:contr] == "book_groups"
        @group = Group.find(params[:id])
        @message = @group.messages.build(user_id: current_user.id)
      else
  		  @message = current_user.messages.build
      end
  	end 

    def message_params
      params.require(:message).permit(:content)
    end

    def render_message(message)
    	render(partial: 'message', locals: { message: message })
    end

    def display_chooser(controller, id = nil)
      if controller == "book_groups"
        Group.find_by(id: id)
      end
    end
end
