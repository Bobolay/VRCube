$document.on 'click', '.video-wrap', ()->

  $(this).addClass('playing')

  target_iframe = $(this).find('iframe')
  videoURL = target_iframe.attr('src')

  target_iframe.attr('src',videoURL+'?autoplay=1')