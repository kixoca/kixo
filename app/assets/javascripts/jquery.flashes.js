$(function() {
    $("#flashes").css('right', '-400px').animate({right: '4%'}, 1000, function() {
        $(this).find('.flash.success, .flash.notice').delay(5000).fadeOut(function() {
            $(this).remove();
        });
    });
});