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

    $togglers.bind("click change", function(e) {
        var $this = $(this);
        var target = $this.data("target") || $this.attr("href");
        var $target = $(target);

        if ( $this.tagName == "A" ) {
            e.preventDefault();
            $this.hasClass("slide") ? $target.slideToggle() : $target.toggle();
        }

        else if ( $this.tagName == "SELECT" ) {
            var value = $this.find("option:selected").val();
            console.log(value);

            if ( $.inArray(value, ["false", "no", "0"] ) ) {
                $this.hasClass("slide") ? $target.slideUp() : $target.hide();
            } else {
                $this.hasClass("slide") ? $target.slideDown() : $target.show();
            }
        }

        else {
            $this.hasClass("slide") ? $target.slideToggle() : $target.toggle();
        }
    });

});
