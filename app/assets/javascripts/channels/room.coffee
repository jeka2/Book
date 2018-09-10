App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if (data.message && !data.message.blank?)
      active_chatroom = $("[data-behavior='messages'][data-group-id='#{data.group_id}']")
      if active_chatroom.length > 0

        if document.hidden && Notification.permission == "granted"
          new Notification(data.username, { body: data.content })

        active_chatroom.append(data.message)
      else
        $("[data-behavior='group-room-link'][data-group-id='#{data.group_id}']").css('font-weight', 'bold')
      end 

  send_message: (group_id, message) ->
    @perform "send_message", { group_id: group_id, content: message }




