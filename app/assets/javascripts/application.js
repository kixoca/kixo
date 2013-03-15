//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require foundation
//= require_tree .

$(document).ready(function() {

    var $body = $( "body" );
    var $head = $( "#head" );
    var $languageSelect = $( "#language-select" ).hide();
    var $gmaps = $( ".gmap" ).gmap();
    var $locationSelector = $( ".location-selector" ).locationSelector();
    var $togglers = $( ".toggle" );
    var $headshots = $(".headshot-2");

    $togglers.click(function(e) {
        var $this = $(this);
        var target = $this.data( "target" ) || $this.attr( "href" );
        var $target = $(target);
        if ( $target.tagName == "A" ) e.preventDefault();
        $this.hasClass( "slide" ) ? $target.slideToggle() : $target.toggle();
    });

    $headshots
        .each(function() {
            var dx = $(this).width() * 0.1;
            var dy = $(this).height() * 0.1;
            $(this).data("dx", dx).data("dy", dy);
            $(this).stop().animate({backgroundPositionX: -0.5*dx+"px", backgroundPositionY: -0.5*dy+"px"}, 0);
        })
        .hover(
            function() {
                $(this).stop().animate({backgroundPositionX: -$(this).data("dx")+"px", backgroundPositionY: -$(this).data("dy")+"px"}, 350);
            },
            function() {
                $(this).stop().animate({backgroundPositionX: -0.5*$(this).data("dx")+"px", backgroundPositionY: -0.5*$(this).data("dy")+"px"}, 350);
            }
        );

});
