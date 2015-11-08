$ ->

  # Our websocket so we can get real time updates
  socket = null
  connect_socket = ->
    socket = new WebSocket "ws://#{window.location.host}/livechat"

    # Listens for messages on the socket
    socket.onmessage = (event) ->
      if event.data.length
        data = $.parseJSON(event.data)
        $("#output").append format_messages(data)
        scroll_down()
    return

  # Format the message for display
  format_messages = (data) ->
    if $("#name").val().toLowerCase() == data.poster_name.toLowerCase()
      text_class = 'label-primary'
    else
      text_class = 'label-default'
    "<p><span class='label #{text_class}'>#{data.poster_name}</span><span class='message-text'>#{data.message}</span></p>"

  # Focus on the useful field
  set_focus = ->
    if !$("#name").val()
      $("#name").focus()
    else
      $("#message").focus()

  # Set a cookie to remember our name for a few days
  $("#name").change((el) ->
    setCookie("name", $(this).val(), 7)
  )

  # Submit the message and clear the input field
  $("#chat_message").ajaxForm(
    url: "/message_items"
    type: "post"
    dataType: "json"
    success: ->
      $("#message").val("").focus()
      scroll_down()
    beforeSubmit: ->
      test_connection()
      name = $("#name").val()
      msg = $("#message").val()
      valid = true
      unless !!name
        toastr["error"](I18n.t("name_required"))
        valid = false
      unless !!msg
        toastr["error"](I18n.t("msg_required"))
        valid = false
      return valid
  )
  
  # Update the chat room with the previous messages, should limit this to something reasonable
  # but requirements don't really care yet
  $.ajax(
    url: '/message_items'
    dataType: "json"
    success: (results) ->
      $.each(results, (idx, result) ->
        $("#previous_messages").append format_messages(result)
      )
      scroll_down()
  )

  # Scrolls the chat window to the most recent messages
  scroll_down = ->
    $('.output-wrapper').animate({ scrollTop: $('.output-wrapper').prop("scrollHeight") }, 'slow');

  # Helper borrowed from the internet to set javascript cookies
  setCookie = (cname, cvalue, exdays) ->
    d = new Date
    d.setTime d.getTime() + exdays * 24 * 60 * 60 * 1000
    expires = 'expires=' + d.toUTCString()
    document.cookie = cname + '=' + cvalue + '; ' + expires
    return

  # Pokes the connection and reopens it if it dies
  test_connection = ->
    connect_socket() if socket && socket.readyState == socket.CLOSED

  # Initial connection
  connect_socket()

  # Check periodically if the socket died, happens on server reboots or solar flares
  setInterval(test_connection, 5000)

  set_focus()
