$document.ready ->

  appeared = $('.slide-up, .fade-in-childrens')

  appeared.appear()

  appeared.on "appear", ()->
    $(this).addClass("animate")