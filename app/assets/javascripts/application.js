//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require foundation
//= require_tree .

$(document).ready(function() {

    var $body = $("body");
    var $head = $("#head");
    var $languageSelect = $("#language-select").hide();
    var $gmaps = $(".gmap").gmap();
    var $locationSelector = $(".location-selector").locationSelector();
    var $togglers = $(".toggle");

    $togglers.click(function(e) {
        var $this = $(this);
        var target = $this.data("target") || $this.attr("href");
        var $target = $(target).first();
        if ( $target.tagName == "A" ) e.preventDefault();
        $this.hasClass("slide") ? $target.slideToggle() : $target.toggle();
    });

});
