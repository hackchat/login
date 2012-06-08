# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#login_form").click(->
    $("#forgot_password").slideUp()
    $("#login").slideDown()
    $("#sign_up_form").slideUp()
    $(this).slideUp()
    $("#forgot_password_toggle").slideDown()
    $("#sign_up_toggle").slideDown()
  )
  $("#forgot_password_toggle").click(->
    $("#forgot_password").slideDown()
    $("#sign_up_form").slideUp()
    $(this).slideUp()
    $("#login").slideUp()
    $("#login_form").slideDown()
    $("#sign_up_toggle").slideDown()
  )
  $("#sign_up_toggle").click(->
    $("#forgot_password").slideUp()
    $("#login_form").slideDown()
    $(this).slideUp()
    $("#sign_up_form").slideDown()
    $("#forgot_password_toggle").slideDown()
    $("#login").slideUp()
  )