class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
  	ActionCable.server.broadcast "chat_for_group_#{message.group_id}", {
  		message: MessagesController.render(message),
  		group_id: message.group_id
  	}
  end
end
