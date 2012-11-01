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
//= require foundation
//= require jquery.transit
//= require_tree .

$(document).ready(function() {

    var $body = $('body');
    var $head = $('#head');
    var $megadrop = $('#megadrop').hide();
    var $ajaxForm = $('form.ajax');

    $head.find('.toggle').live('click', function(e) {
        e.preventDefault();
        $megadrop.slideToggle();
        $(this).find('.icon').toggleClass('icon-plus-sign').toggleClass('icon-minus-sign')
    });

    $ajaxForm.find('.alert-box').hide();

    $ajaxForm.bind('success', function() {
        $(this).find('.alert-box').hide().filter('.success').fadeIn();
    });

    $ajaxForm.bind('error', function() {
        $(this).find('.alert-box').hide().filter('.alert').fadeIn();
    });

    $ajaxForm.filter('.devise').submit(function(e) {
        e.preventDefault();

        var $this = $(this);
        var email = $this.find('#user_email').val();
        var password = $this.find('#user_password').val();
        var password_confirmation = $this.find('#user_password_confirmation').val();
        var url = $this.attr('action');

        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'json',
            data: {user: {email: email, password: password}},
            success: function() {
                $this.trigger('success');
                $head.load("# #head > .container");
                $('.show-on-sign-in').hide().removeClass('hide').fadeIn();
                $('.hide-on-sign-in').fadeOut().addClass('hide').hide();
                setTimeout(function() {
                    $this.parents('.reveal-modal').trigger('reveal:close');
                }, 500);
            },
            error: function() {
                $this.trigger('error');
            }
        });
    });

});