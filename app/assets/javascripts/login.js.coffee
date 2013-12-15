$ ->
  $('.login-options').children('li').children('a').on 'click', (e) ->
    $('.login-options').find('li').removeClass('active')
    $(@).parent().addClass('active')

    hidePasswordField = ->
      $('#password-label').hide()
      $('#user_password').hide()
      $('#show-password-button').hide()
      $('#user_password').val('')
      $('#user_password').attr('required',null)

    showPasswordField = ->
      $('#password-label').show()
      $('#user_password').show()
      $('#show-password-button').show()
      $('#user_password').attr('required',true)

    if $(@)[0].id == 'reset-pill'
      $('legend').html('Please enter your email')
      $('#submit-button').val('Reset')
      hidePasswordField()
    else
      $('legend').html('Please sign in')
      $('#submit-button').val('Sign in')
      showPasswordField()

    $('#user_email').focus()
    e.preventDefault()
