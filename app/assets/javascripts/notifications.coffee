$(document).on 'ready turbolinks:change turbolinks:load', ->
    if (window.location.pathname == '/notifications')
      $.ajax '/notifications/read_all',
        type: 'PUT'
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("Update was success!!")
        success: (data, textStatus, jqXHR) ->
         alert('OPS!!!')

