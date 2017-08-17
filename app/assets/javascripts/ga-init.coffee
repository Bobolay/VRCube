
#     F U N C T I O N S

# click on btn for game reservation
orderClick = (e)->
  ga('send', 'e', {
    eventCategory: 'button',
    eventAction: 'click',
    eventLabel: 'order game'
  })
  console.log('orderClick')

# click on btn for call-me-back request
callMeBackClick = (e)->
  ga('send', 'e', {
    eventCategory: 'button',
    eventAction: 'click',
    eventLabel: 'call me back'
  })
  console.log('callMeBackClick')

# click on video to play it
playVideo = (e)->
  ga('send', 'e', {
    eventCategory: 'video',
    eventAction: 'click',
    eventLabel: 'video about game'
  })
  console.log('playVideoClick')



#     T A R G E T     B T N S

$document.on 'click', '.reserve-btn', ()->
  orderClick()

$document.on 'click', '.contact-form .corner-btn', ()->
  callMeBackClick()

$document.on 'click', '.video-wrap', ()->
  playVideo()



# ATTENTION!!! SLIDE INTERACTIONS ARE IN BXSLIDER.COFFEE FILE