$ ->
    $('.tack').click (e) ->
        e.preventDefault()
        $.ajax
            url: $(this).attr('href')
            type: 'GET'
            dataType: 'json'
            success: (data) ->
                $('#tack_show_name').html(data["name"])
                $('#tack_show_desc').html(data["description"])
                $('#tack_show').modal('show')
