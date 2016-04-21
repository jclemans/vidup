jQuery ->
  $('#video-form').fileupload
    dataType: 'script'
    progress: (e, data) ->
      $('#loading-wrapper').show()
      if data.context
        estimatedDuration = Math.ceil((data.total - data.loaded) * 8 / data.bitrate)
        $('#percent').text('0%  |  ')
        $('#time').text(estimatedDuration + ' seconds remaining')
        animateProgress = ->
          refreshIntervalId = setInterval((->
            percent = Math.round((data.loaded / data.total) * 100)
            secondsRemaining = Math.ceil((data.total - data.loaded) * 8 / data.bitrate)
            
            progress_val = $('.progress').val()
            if progress_val < 100
              $('.progress').animate({
                'value': percent
              }, {
                duration: (estimatedDuration) * 1000,
                easing: 'linear'
                complete: ->
                  clearInterval(refreshIntervalId)
              })
              $('.progress').val(percent)
              $('#percent').text(percent + '%  |  ')
              $('#time').text(secondsRemaining + ' seconds remaining')
              progress_val = percent
            
            else if $('.progress').val() >= 100
              $('#loading-wrapper').delay(3000).fadeOut()
              $('#video-form')[0].reset()
              clearInterval(refreshIntervalId)
          ), 1000)

        animateProgress()

    add: (e, data) ->
      $('.progress').val(0)
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#latest-video').prepend(data.context)
      data.submit()
