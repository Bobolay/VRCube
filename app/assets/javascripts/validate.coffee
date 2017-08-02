submit_form = (form, e)->
  if e && e.preventDefault
    e.preventDefault()
  $form = $(form)
  url = $form.attr("action")
  console.log "form action: ", url
  alert("thanks")

  $.ajax({
    url: url
    type: "post"
    data: $form.serialize()
  })

  false

$document.ready ->

  $("form.call-me-form").each(->

    $(this).validate({
      rules:
        name:
          required: true,
          minlength: 3
        phone:
          required: true,
          minlength: 10

      submitHandler: submit_form

    })
  )


$document.on "submit", "form.reservation-form", (e)->
  submit_form($(this), e)
