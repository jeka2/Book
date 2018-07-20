class MessagesController < ApplicationController
 
 before_action :get_messages

 def index 
 	@messages = Message.all
 end 

 def create
   
  end

  private

  	def get_messages
  		@message = current_user.messages.build
  	end 

    def message_params
      params.require(:message).permit(:content)
    end
end
