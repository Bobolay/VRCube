$document.on 'click', '.acordion-container .inner', (e)->

    e.preventDefault()
    
    $this = $(this)
    
    $this.siblings().removeClass('active')
    $this.addClass('active')