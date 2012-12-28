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

    $head.find(".toggle").click(function(e) {
        e.preventDefault();
        $languageSelect.slideToggle();
    });

});
