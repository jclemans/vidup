$(document).ready ->
  $('.progress').val(0)

  $('#video-form').fileupload
    dataType: 'script'
    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#new_painting').append(data.context)
      data.submit()
    progress: (e, data) ->
      $('#loading-wrapper').show()
      if data.context
        percent = parseInt(data.loaded / data.total * 100, 10)
        $('.progress').val(percent)
        $('#percent').text(percent + '%')
      if percent >= 100 # reset the progress bar after upload
        $('#loading-wrapper').delay(4000).fadeOut()
        $('#video-form')[0].reset()

  return false
