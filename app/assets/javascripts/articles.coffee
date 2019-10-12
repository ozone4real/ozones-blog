# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
  $('#upload-cover-img').change (e) ->
    blobURL = window.URL.createObjectURL(e.target.files[0])
    $('.img-preview').css({"background": "url(#{blobURL}) no-repeat center center", "background-size": "contain"}).show()
    $('#close-icon').show()
  $('#close-icon').click ->
    $(this).hide()
    $('#upload-cover-img').val(null)
    $('.img-preview').hide()
  $('.article-reactions-sec #like-button, .comment-reactions-sec #like-button').click (e) ->
    e.preventDefault()
    parent = $(e.target.closest('.reactions-section'))
    likeCount = parseInt parent.find('.like-count').text()
    if $(this).hasClass('far') then parent.find('.like-count').text(likeCount + 1) else parent.find('.like-count').text(likeCount - 1)
    $(this).toggleClass('fas').toggleClass('far')

  $('.comment-actions .fa-edit').click (e) ->
    e.preventDefault()
    parent = $(e.target.closest('.right-sec'))
    parent.find('.comment-cont').hide()
    parent.find('form').show()
    parent.find('form .ql-editor').focus()
    $('.cancel-btn').click (e) ->
      e.preventDefault()
      parent.find('.comment-cont').show()
      parent.find('form').hide()

  $('#selectpicker').multiselect()
    

