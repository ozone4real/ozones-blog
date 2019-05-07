# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  navLinks = $('.nav-tabs .nav-link')
  $("##{$('.nav-link.active').data('content')}").show()
  navLinks.click (e) ->
    $(this).addClass('active')
    navLinks.not(this).removeClass('active')
    $(".profile-tabs ##{$(this).data('content')}").show()
    $(".tab-item:not(##{$(this).data('content')})").hide()

  $('#profile-img-upload').change (e) ->
    file = this.files[0]
    formData = new FormData();
    formData.append('image_url', file)
    $.ajax({
          url: '/profile/update_profile_img',
          method: 'PATCH',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          data: formData,
          dataType: 'json',
          processData: false,
          contentType: false
        })
        .done(({user: {image_url}}) -> 
          console.log image_url
          $('.profile-img').attr('src', image_url.url)
        )
        .fail(({responseJSON, status}) -> 
          console.log responseJSON
        )
  $('.profile-edit-btn').click ->
    editButton = $(this)
    editButton.hide()
    $('.update-buttons').show()
    $("[data-field]").hide()
    $('.edit-input').show()
    $('.edit-input:first').focus()
    # emailField = $("[data-field = 'fullname']")
    # bioField = $("[data-field = 'bio']")
    # emailField.replaceWith("<input type='text' value='#{emailField.html()}'/>")
    # bioField.replaceWith("<textarea> #{bioField.html()}</textarea>")
    $('.cancel-btn').click ->
      $("[data-field").show()
      $('.edit-input').hide()
      $('.update-buttons').hide()
      editButton.show()
    profileContainer = $('.profile-container')
    
    # fieldsToEdit = $("[data-field")
    # fieldsToEdit.each (i, obj) ->
    #   console.log $(this)
    #   $(this).replaceWith("<input type='text' value='#{$(this).html()}'> </input>")
    # fieldsToEdit

    # blobUrl = window.URL.createObjectURL(this.files[0])
  $('.save-btn').click ->
    data = 
      bio: $('.edit-input .bio').val(),
      full_name: $('.edit-input.fullname').val()
    console.log(data.bio)
    console.log(data.full_name)
    $.ajax({
          url: '/profile/edit_profile',
          method: 'PATCH',
          headers: {'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')},
          contentType: 'application/json',
          data: JSON.stringify(data),
          dataType: 'json'
        })
        .done(() -> window.location.href = '/profile' )
        .fail(({responseJSON, status}) -> 
          for key, value of responseJSON
            $("#signup-form input[name= #{key}]").next().html("#{key} #{value}")
        )

# $(window).scroll ->
#   console.log $('.nav-tabs').position()