$document.ready ->

  setTimeout(
    ->
      $('.banner-wrap').addClass('turn-on-effect')
    700
    )

  btn_holder = $('.order-btn-holder')

  setTimeout(
    ->
      btn_holder.addClass('show-btn')
    2500
    )

  setTimeout(
    ->
      btn_holder.addClass('light-on')
    4000
  )