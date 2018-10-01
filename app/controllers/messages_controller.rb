class MessagesController < ApplicationController
 
 before_action :get_messages
 helper_method :display_chooser

 def index 
 	@messages = @group.messages.limit(100)
 end 

 


  private

  	def get_messages
      p "++++++"
      p params[:group_id]
        @group = Group.find(params[:group_id])
        @message = @group.messages.build(user_id: current_user.id)
  		  ##@message = current_user.messages.build
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
