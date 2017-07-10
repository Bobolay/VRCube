$document.ready ->

  btn_holder = $('.order-btn-holder')
  btn_holder.addClass('show-btn')
  setTimeout(
    ->
      btn_holder.addClass('light-on')
    1000
  )
