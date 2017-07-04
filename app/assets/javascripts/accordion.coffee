$document.on 'click', '.acordion-container .inner', (e)->

    e.preventDefault()

    if width > 640
    
      $this = $(this)
      index = $this.index()
      console.log(index)
      
      $this.siblings().removeClass('active')
      $this.addClass('active')