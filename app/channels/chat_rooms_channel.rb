class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
  end
end