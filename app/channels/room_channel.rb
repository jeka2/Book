class RoomChannel < ApplicationCable::Channel

  def subscribed
    @current_user = current_user
  	current_user.groups.uniq.each do |group|
  		stream_from "chat_for_group_#{group.id}"
  	end
    stream_from "room_channel"
    stream_from "room_channel_user_#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
  	@group = Group.find(data["group_id"])
  	message = @group.messages.create(content: data["content"], user_id: current_user.id)
  	MessageRelayJob.perform_later(message, @current_user.id)
  end
end
