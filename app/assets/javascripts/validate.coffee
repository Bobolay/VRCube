$document.ready ->

  $("form").each(->

    $(this).validate({
      rules:
        name:
          required: true,
          minlength: 3
        ,
        phone:
          required: true,
          minlength: 10
        ,
        date:
          required: true
        ,
        time:
          required: true
      submitHandler: (form)->
        $form = $(form)
        url = $form.attr("action")
        alert("thanks")

        $.ajax({
          url: url
          type: "post"
          data: $form.serialize()
        })

        false
    })
  )

