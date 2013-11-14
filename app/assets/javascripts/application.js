// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
  console.log( "ready!" );

  $(function(){
    $.ajaxSetup({
      beforeSend: function( xhr ) {
        var token = $('meta[name="csrf-token"]').attr('content');
        if (token) xhr.setRequestHeader('X-CSRF-Token', token);
      }
    });
  });

  $('#log-in-link').click(function(e){
     e.preventDefault();
    $('#log-in-box').show();
  });

  $('#sign-up-link').click(function(e){
     e.preventDefault();
    $('#sign-up-box').show();
  });

  $('#story-link').click(function(e){
     e.preventDefault();
    $('#story-box').show();
  });


  $("form#sign_in_user").bind("ajax:success", function(e, data, status, xhr) {
    if(data.success) {
      $('#log-in-box').hide();
      $('#signed-in-links').show();
      $('#welcome-links').hide();
      $('#email').html(data.email)
      // $('#submit_comment').slideToggle(1000, "easeOutBack");
    } else {
      alert('failure!');
      $('#welcome-links').show();
    }
  });  
});



