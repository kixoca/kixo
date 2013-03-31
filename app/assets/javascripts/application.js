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

    $togglers.filter("a").click(function(e) {
        var $this = $(this);
        var target = $this.data("target") || $this.attr("href");
        var $target = $(target);

        e.preventDefault();

        $this.hasClass("slide") ? $target.slideToggle() : $target.toggle();
    });

    $togglers.filter("select").bind("change initSelectTogglers", function(e) {
        var $this = $(this);
        var target = $this.data("target") || $this.attr("href");
        var $target = $(target);
        var value = $this.find("option:selected").val();

        if ( $.inArray(value, ["false", "no", "0"] ) ) {
            $this.hasClass("slide") ? $target.slideUp() : $target.hide();
        } else {
            $this.hasClass("slide") ? $target.slideDown() : $target.show();
        }
    }).trigger("initSelectTogglers");

    $togglers.filter("input:checkbox").bind("change initCheckboxTogglers", function(e) {
        var $this = $(this);
        var target = $this.data("target") || $this.attr("href");
        var $target = $(target);

        if ( $this.prop("checked") ) {
            $this.hasClass("slide") ? $target.slideDown() : $target.show();
        } else {
            $this.hasClass("slide") ? $target.slideUp() : $target.hide();
        }
    }).trigger("initCheckboxTogglers");

});
