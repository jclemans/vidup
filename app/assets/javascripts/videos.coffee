$(document).ready ->
  $('#video-form').fileupload
    dataType: 'script'
    add: (e, data) ->
      $('.progress').val(0)
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#new_painting').append(data.context)
      data.submit()
    progress: (e, data) ->
      $('#loading-wrapper').show()
      if data.context
        percent = parseInt(data.loaded / data.total * 100, 10)
        secondsToComplete = Math.round((data.total - data.loaded) * 8 / data.bitrate)
        $('.progress').val(percent)
        $('#percent').text(percent + '%  |  ')
        $('#time').text(secondsToComplete + ' seconds remaining')
      if percent >= 100 # reset the progress bar after upload
        $('#loading-wrapper').delay(4000).fadeOut()
        $('#video-form')[0].reset()

  return false
