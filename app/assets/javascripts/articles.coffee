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
  $('#like-button').click ->
    likeCount = parseInt $('#like-count').text()
    if $(this).hasClass('far') then $('#like-count').text(likeCount + 1) else $('#like-count').text(likeCount - 1)
    $(this).toggleClass('fas').toggleClass('far')
  $('#selectpicker').multiselect()
    

