popup = $('.popup-wrap')

#     M A P     P O P U P

$document.on 'click', '.map-btn', ->

  popup.addClass('show-map')
  body.addClass('hidden')

#     R E S E R V E     F O R M

$document.on 'click', '.reserve-btn', ->

  popup.addClass('show-reserve-form')
  body.addClass('hidden')


#     C L O S E     P O P U P S

$document.on 'click', '.close-popup', ->

  popup.addClass('turn-off-effect')
  setTimeout(
    ->
      popup.removeClass('turn-off-effect')
    500
  )
  setTimeout(
    ->
      popup.removeClass('show-map show-reserve-form')
      body.removeClass('hidden')
    500
  )


$document.on 'click', '.top-btn', ->

  btn = $(this)
  btn.parent().children().removeClass('active')
  btn.addClass('active')
  $form = btn.closest("form")

  if btn.hasClass('show-address')
    $('.address-input').addClass('visible')
    $form.attr("action", $form.attr("data-home-order-url"))
  else
    $('.address-input').removeClass('visible')
    $form.attr("action", $form.attr("data-session-order-url"))


$document.ready ->
  $("a.video-popup").YouTubePopUp()