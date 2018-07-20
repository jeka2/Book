class MessagesController < ApplicationController
 
 before_action :get_messages

 def index 
 	@messages = Message.all
 end 

 def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast 'room_channel',
                                   content:  message.content,
                                   username: message.user.first_name
    end
  end

  private

  	def get_messages
  		@message = current_user.messages.build
  	end 

    def message_params
      params.require(:message).permit(:content)
    end
end
