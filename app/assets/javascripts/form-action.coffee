submit_form = (form, e)->
  if e && e.preventDefault
    e.preventDefault()
  $form = $(form)
  url = $form.attr("action")
  console.log "form action: ", url

  $('button.reserve-btn, button.corner-btn').addClass('success')
  setTimeout(
    ->
      $('button.reserve-btn, button.corner-btn').removeClass('success')
      $(form).find('input').val('')
    3000
  )

  $.ajax({
    url: url
    type: "post"
    data: $form.serialize()
  })

  false

$document.ready ->

  $("form.call-me-form, form.reservation-form").each(->

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