/*
 * gmap
 *
 * @author Jonathan Roy <jroy@optimumweb.ca>
 * @version 1.1
 */

!function($) {

    $(function() {

        "use strict"; // jshint ;_;

        jQuery.fn.gmap = function() {

            return this.each(function() {

                var $gmap    = $(this);
                var gmapId   = $gmap.attr('id') ? $gmap.attr('id') : $gmap.attr('id', 'map-' + (new Date().getTime())).attr('id');
                var gmapLat  = $gmap.data('latitude');
                var gmapLng  = $gmap.data('longitude');
                var gmapZoom = $gmap.data('zoom') || 14;
                var $markers = $gmap.children('.marker');

                var gmapLatLng = new google.maps.LatLng(gmapLat, gmapLng);

                var gmapOptions = {
                    zoom:      gmapZoom,
                    center:    gmapLatLng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }

                var gmap = new google.maps.Map(document.getElementById(gmapId), gmapOptions);

                $markers.each(function() {

                    var $marker        = $(this);
                    var markerId       = $marker.attr('id') ? $marker.attr('id') : $marker.attr('id', 'map-marker-' + (new Date().getTime())).attr('id');
                    var markerLat      = $marker.data('latitude');
                    var markerLng      = $marker.data('longitude');
                    var markerTitle    = $marker.data('title');
                    var markerMaxWidth = $marker.data('max-width') || 300;
                    var markerContent  = $marker.html();

                    var markerLatLng = new google.maps.LatLng(markerLat, markerLng);

                    var marker = new google.maps.Marker({
                        position: markerLatLng,
                        title:    markerTitle,
                        map:      gmap
                    });

                    if ( markerContent ) {

                        var markerInfoWindow = new google.maps.InfoWindow({
                            content:  markerContent,
                            position: markerLatLng,
                            maxWidth: parseInt(markerMaxWidth)
                        });

                        google.maps.event.addListener(marker, 'click', function() {
                            markerInfoWindow.open(gmap, marker);
                        });

                    }

                });

            });

        };

    })

}(window.jQuery);