class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message, current_user)
  	username = User.find_by(id: message.user_id)
  	username = username.first_name + " " + username.last_name
  	ActionCable.server.broadcast "chat_for_group_#{message.group_id}", {
  		message: MessagesController.render(message),
  		group_id: message.group_id,
  		username: username,
  		content: message.content,
  	}
  end
end
