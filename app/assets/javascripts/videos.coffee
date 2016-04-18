$(document).ready ->
  
  $('#video-form').fileupload
    dataType: 'script'
    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#new_painting').append(data.context)
      data.submit()
    progress: (e, data) ->
      if data.context
        percent = parseInt(data.loaded / data.total * 100, 10)
        $('#loading-wrapper').show()
        $('.progress').val(percent)

  $('#loading-wrapper').hide()
  $('.progress').val(0)
  return false
