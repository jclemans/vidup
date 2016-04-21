jQuery ->
  $(".alert-info" ).fadeOut(5000);
  $('#video-form').fileupload
    dataType: 'script'
    
    add: (e, data) ->
      data.context = $(tmpl("template-upload", data.files[0]))
      $('#latest-video').prepend(data.context)
      data.submit()
    
    progress: (e, data) ->
      $('#loading-wrapper').show()
      if data.context
        estimatedDuration = Math.ceil((data.total - data.loaded) * 8 / data.bitrate)
        $('#percent').text('0%  |  ')
        $('#time').text(estimatedDuration + ' seconds remaining')
        animateProgress = ->
          refreshIntervalId = setInterval((->
            progress_val = $('.progress').val()
            if progress_val < 100
              percent = Math.round((data.loaded / data.total) * 100)
              secondsRemaining = Math.ceil((data.total - data.loaded) * 8 / data.bitrate)
              $('.progress').animate({
                'value': percent
              }, {
                duration: (estimatedDuration + 1) * 1000,
                easing: 'linear'
                complete: ->
                  clearInterval(refreshIntervalId)
              })
              $('#percent').delay(500).text(percent + '%  |  ')
              $('#time').delay(500).text(secondsRemaining + ' seconds remaining')
              $('.progress').val(percent)
              progress_val = percent
            
            else if $('.progress').val() >= 100
              clearInterval(refreshIntervalId)
          ), 1000)

        animateProgress()

    done: (e, data) ->
      $('#loading-wrapper').delay(3000).fadeOut()
      $('.progress').val(0)
      $('#video-form')[0].reset()

