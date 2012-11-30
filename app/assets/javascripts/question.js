$(document).ready(function() {
    $('.question.loop').hoverIntent(
        function() { $(this).find('.answers').stop(true,true).slideDown(250); },
        function() { $(this).find('.answers').stop(true,true).slideUp(250); }
    ).find('.answers').hide();
});