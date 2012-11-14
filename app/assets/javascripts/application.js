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
    var $languageSelect = $('#language-select').hide();
    var $maps = $('.map');

    $head.find('.toggle').click(function(e) {
        e.preventDefault();
        $languageSelect.slideToggle();
    });

    $maps.each(function() {
        var $map = $(this);
        var mapId = $map.attr('id') ? $map.attr('id') : $map.attr('id', 'map-' + (new Date().getTime())).attr('id');
        var mapLat = $map.data('latitude');
        var mapLng = $map.data('longitude');
        var mapZoom = $map.data('zoom') || 14;
        var mapContent = $map.html();

        var mapLatLng = new google.maps.LatLng(mapLat, mapLng);

        var mapOptions = {
            zoom: mapZoom,
            center: mapLatLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }

        var map = new google.maps.Map(document.getElementById(mapId), mapOptions);

        var mapMarker = new google.maps.Marker({
            position: mapLatLng,
            map: map,
            title: ''
        });

        if ( mapContent ) {
            var mapInfoWindow = new google.maps.InfoWindow({
                content: mapContent
            });

            google.maps.event.addListener(mapMarker, 'click', function() {
                mapInfoWindow.open(map, mapMarker);
            });
        }
    });

});
