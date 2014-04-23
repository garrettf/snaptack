$ ->
  # Update tack positions on render
  tacks_positions_update = () ->
    w_max = $('#board_img').data('width')
    h_max = $('#board_img').data('height')
    w = $('#board_img').width()
    h = $('#board_img').height()
    $('.tack_icon').each () ->
      $(this).css('left', Math.round($(this).data('left') / w_max * w) + 'px')
      $(this).css('top', Math.round($(this).data('top') / h_max * h) - 24 + 'px')

  $(window).load () ->
    tacks_positions_update()
  $(window).resize () ->
    tacks_positions_update()

  $('.tack').click (e) ->
    e.preventDefault()
    currentTackURL = $(this).attr('href')
    $('#new_photo').attr('action', currentTackURL + '/photos')
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
      w_max = $('#board_img').data('width')
      h_max = $('#board_img').data('height')
      w = $('#board_img').width()
      h = $('#board_img').height()
      $('#tack_top').val( Math.round((e.clientY - offset.top) / h * h_max) )
      $('#tack_left').val( Math.round((e.clientX - offset.left) / w * w_max) )
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



