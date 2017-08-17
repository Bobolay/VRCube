$(document).ready ->

  # GA SLIDER - user actually interact with it
  detectSlide = (e)->
    ga('send', 'e', {
      eventCategory: 'slider',
      eventAction: 'view',
      eventLabel: $('.games-slider').find( 'li' ).attr('data-game')
    })
    console.log('slide changed')

    #     G A M E S     S L I D E R

  games_slider = $('.games-slider').bxSlider
    controls: false
    pager: false
    speed: 750
    pause: 10000
    auto: true
    mode: 'fade'
    onSliderLoad: (currentIndex)->
      $('.slide-description .inner-text').eq(0).addClass('visible')
    onSlideBefore: ($slideElement, oldIndex, newIndex)->
      current = games_slider.getCurrentSlide()
      $('.slide-description .inner-text').removeClass('visible')
      $('.slide-description .inner-text').eq(current).addClass('visible')
  $('.slide-description .slider-prev').click ->
    games_slider.goToPrevSlide()
    detectSlide()
  $('.slide-description .slider-next').click ->
    games_slider.goToNextSlide()
    detectSlide()