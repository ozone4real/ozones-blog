validationSchema = 
  email: /^[A-Za-z0-9][\w.-][a-zA-Z0-9]+@(\w{2,}\.){1,2}[a-z]{2,20}$/, 
  username: /^([a-zA-Z0-9][\w-]+[a-zA-Z0-9]){1,}$/,
  password: /^(?=.*[0-9])(?=.*[a-zA-Z])([\w-]{8,})$/

validationMessages = 
  email: 'Please enter a valid email address',
  username: 'Username must start and end with an alphaNumeric character, may contain "-" or "_" and must be at least 3 characters long.',
  password: 'Password must contain alphabets and numbers and must be at least 8 characters long'

$(document).on 'turbolinks:load', ->
  $('.modal').click (e) ->
    $(this).hide(500) unless e.target.closest('.modal-content')

  $('.signup-modal-trigger').click ->
    $('.modal').show(500)
    $('.modal-content:not(.signup-form)').hide()
    $('.signup-form').show(500, ->
      input = $('.signup-form input')
      input.on ('input'), ({target}) ->
        target.nextElementSibling.innerHTML = ''
  
      input.blur ({target}) ->
        {name, value} = target
        target.nextElementSibling.innerHTML = validationMessages[name] unless validationSchema[name].test(value)

    )

  $('.login-modal-trigger').click ->
      $('.modal').show(500)
      $('.modal-content:not(.login-form)').hide()
      $('.login-form').show(500)
    

    $('#signup-form').submit (e) ->
        e.preventDefault();
        errors = false
        $('#signup-form input').each ->
           if not validationSchema[$(this).attr('name')].test($(this).val())
            $(this).next().html(validationMessages[$(this).attr('name')])
            errors = true

        return if errors 
        data = 
          email: $('#signup-form input[name= email]').val(),
          password: $('#signup-form input[name= password]').val(),
          username: $('#signup-form input[name= username]').val()
        
        $('.signup-form button').html()
    
        $.ajax({
          url: '/signup',
          method: 'POST',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          contentType: 'application/json',
          data: JSON.stringify(data),
          dataType: 'json'
        })
        .done(({responseJSON, status}) -> window.location.replace('/') )
        .fail(({responseJSON, status}) ->
          console.log responseJSON 
          for key, value of responseJSON
            $("#signup-form input[name= #{key}]").next().html("#{key} #{value}")
        )

    $('#login-form').submit (e) ->
        e.preventDefault();
        data = 
          email: $('#login-form input[name= email]').val(),
          password: $('#login-form input[name= password]').val(),
        
    
        $.ajax({
          url: '/login',
          method: 'POST',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          contentType: 'application/json',
          data: JSON.stringify(data),
          dataType: 'json'
        })
        .done(({responseJSON, status}) ->
          console.log(responseJSON)
          window.location.reload() )
        .fail(({responseJSON, status}) -> 
          console.log(responseJSON)
          $('#login-error-message').html(responseJSON.message)
        )

  $('.scroll-next-btn').click ->
     scrollOffset = $('.categories-list')[0].scrollWidth - $('.categories-list')[0].offsetWidth
     $('.categories-list').scrollLeft(scrollOffset)
     $(this).hide()
     $('.scroll-prev-btn').show()
  $('.scroll-prev-btn').click ->
    $('.categories-list').scrollLeft(0)
    $(this).hide()
    $('.scroll-next-btn').show()

  $(window).scroll ->
    if window.pageYOffset >= $('.nav-header-cont').scrollTop()
      $('.nav-header-cont').css({"position": "sticky", 'top': '0'})
      # $('.container').css('padding-top', '70px')


