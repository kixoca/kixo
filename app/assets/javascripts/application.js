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
//= require jquery
//= require jquery
//= require_tree .

$(document).ready(function() {

    var $body = $('body');
    var $head = $('#head');
    var $languageSelect = $('#language-select').hide();
    var $gmaps = $('.gmap');

    $head.find('.toggle').click(function(e) {
        e.preventDefault();
        $languageSelect.slideToggle();
    });

    $gmaps.each(function() {
        var $gmap = $(this);
        var gmapId = $gmap.attr('id') ? $gmap.attr('id') : $gmap.attr('id', 'map-' + (new Date().getTime())).attr('id');
        var gmapLat = $gmap.data('latitude');
        var gmapLng = $gmap.data('longitude');
        var gmapZoom = $gmap.data('zoom') || 14;
        var gmapContent = $gmap.html();

        var gmapLatLng = new google.maps.LatLng(gmapLat, gmapLng);

        var gmapOptions = {
            zoom: gmapZoom,
            center: gmapLatLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }

        var gmap = new google.maps.Map(document.getElementById(gmapId), gmapOptions);

        var gmapMarker = new google.maps.Marker({
            position: gmapLatLng,
            map: gmap,
            title: ''
        });

        if ( gmapContent ) {
            var mapInfoWindow = new google.maps.InfoWindow({
                content: gmapContent
            });

            google.maps.event.addListener(gmapMarker, 'click', function() {
                mapInfoWindow.open(gmap, gmapMarker);
            });
        }
    });

});
