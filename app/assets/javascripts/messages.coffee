$(document).on 'turbolinks:load', ->
  $('#message_content').on 'keydown', (e) ->
    if e && e.keyCode == 13 && !e.shiftKey
      console.log "done"
      e.preventDefault()
      $(this).submit()

  $('#message_content').on 'submit', (e) ->
    e.preventDefault()
    room_id = $("[data-behavior='messages']").data("group-id")
    content    = $("#message_content")

    App.room.send_message(room_id, content.val())

    content.val("")