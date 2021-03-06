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

  
  
  $(document.body).click (e) ->
    console.log(e.target)
    if e.target.closest('.hamburger')
      $(this).toggleClass('prevent-scroll')
      return $('.categories-cont').toggleClass('nav-hidden')
    if !e.target.closest('.categories-cont')
      $('.categories-cont').addClass('nav-hidden')
      $(this).removeClass('prevent-scroll')

  h = $('.categories-cont').height()
  lastScrollTop = window.pageYOffset
  $('.popular-articles').css({top: $('.nav-header-cont').height() + 50 })

  handleScroll = ()  ->
    st = window.pageYOffset

    coords2 = $('.header')[0].getBoundingClientRect()
    $('.popular-articles').css({top: $('.nav-header-cont').height() + 40 })
    if st > lastScrollTop 
      $('.categories-cont').css({top: 0, position: 'absolute', zIndex: -1})
    else
      $('.categories-cont').css({top: coords2 && coords2.bottom, position: 'static', zIndex: 1000})
    lastScrollTop = if st <= 0 then 0 else st
  window.addEventListener('scroll', handleScroll, false)

  

  if $('.popular-articles').length
    options = {
      root: null
      rootMargin: "-#{$('.nav-header-cont').height()}px 0px 0px 0px"
    }

    handleIntersect1 = (entries, options) ->
      if !entries[0].isIntersecting
        $('.popular-articles').addClass('position-fixed')
      else
        $('.popular-articles').removeClass('position-fixed')

    handleIntersect2 = (entries, options) ->
      console.log entries[0]
      if entries[0].isIntersecting
        $('.popular-articles').removeClass('position-fixed')
      else
        $('.popular-articles').addClass('position-fixed')
    
    new IntersectionObserver(handleIntersect1, options).observe($('.intersect-elem')[0])
    new IntersectionObserver(handleIntersect2).observe($('footer')[0])


