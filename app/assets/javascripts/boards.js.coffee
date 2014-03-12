$ ->
  currentTackURL = ""
  $('.tack').click (e) ->
    e.preventDefault()
    currentTackURL = $(this).attr('href')
    $.ajax
      url: $(this).attr('href')
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $('#tack_show_name').html(data["name"])
        $('#tack_show_desc').html(data["description"])
        $('#tack_show').modal('show')
        $.ajax
          url: currentTackURL + '/photos'
          type: 'GET'
          dataType: 'json'
          success: (data) ->
            for photo in data
              $('#tack_show_body').append('<img src="'+photo['url']+'">')

  # Update photo form when opening new photo modal
  $('#photo_new_btn').click ->
    $('#new_photo').attr('action', currentTackURL + '/photos')
    $('#photo_new').modal('show')

  # Clear images when closing a tack
  $('#tack_show').on 'hidden.bs.modal', ->
    $('#tack_show_body').children('img').remove()

  # Tack position picker
  $('#tack_new_btn').click ->
    $('#blackout').fadeIn(200)
    $('#board_img').css('cursor', 'crosshair')
    $('#board_img').css('z-index', '1000')
    $('.tack_icon').css('z-index', '1001')
    $('#board_img').on 'click', (e) ->
      offset = $(this).offset()
      $('#tack_top').val( Math.round(e.clientY - offset.top) )
      $('#tack_left').val( Math.round(e.clientX - offset.left) )
      $('#board_img').css('cursor', 'auto')
      $('#blackout').fadeOut 200, ->
        $('#board_img').css('z-index', 'auto')
        $('.tack_icon').css('z-index', 'auto')
        $('#tack_new').modal('show')
      $('#blackout').off 'click'
      $(this).off 'click'
    $('#blackout').on 'click', ->
      $('#board_img').css('cursor', 'auto')
      $('#blackout').fadeOut 200, ->
        $('#board_img').css('z-index', 'auto')
        $('.tack_icon').css('z-index', 'auto')
      $('#board_img').off 'click'
      $(this).off 'click'



