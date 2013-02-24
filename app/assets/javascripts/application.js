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

    $togglers.click(function(e) {
        var $this = $(this);
        var target = $this.data( "target" ) || $this.attr( "href" );
        var $target = $(target);
        if ( $target.tagName == "A" ) e.preventDefault();
        $this.hasClass( "slide" ) ? $target.slideToggle() : $target.toggle();
    });

    $( "input.autocomplete").each(function() {
        var $this = $(this);

        $this.autocomplete({
            source: function( request, response ) {
                $.ajax({
                    url: $this.data( "source" ),
                    dataType: "json",
                    data: {
                        term: request.term
                    },
                    success: function( data ) {
                        response( $.map( data, function( item ) {
                            return {
                                id:    item.id,
                                label: item.label,
                                value: item.name
                            }
                        }));
                    }
                });
            },
            minLength: 2
        });
    });

});
