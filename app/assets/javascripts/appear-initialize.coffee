$document.ready ->

  if width > 640

    appeared = $('.slide-up, .fade-in-childrens')

    appeared.appear()

    appeared.on "appear", ()->
      $(this).addClass("animate")

  else
    console.log("Screen with less than 640px")