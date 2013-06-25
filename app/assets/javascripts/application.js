//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require foundation
//= require_tree .

$(document).ready(function() {

    $(".gmap").gmap();

    $(".reveal-modal.auto-open").reveal();

    $(".fndtn-activate-tab").click(function() {
        $(".tabs a[href='" + $(this).attr("href") + "']").click();
    });

    var addresspicker = $("#addresspicker").addresspicker({
        regionBias: "fr",
        updateCallback: showCallback,
        elements: {
            lat: "#address_lat",
            lng: "#address_lng",
            street_number: '#address_street_number',
            route: '#address_route',
            locality: '#address_locality',
            administrative_area_level_2: '#address_administrative_area_level_2',
            administrative_area_level_1: '#address_administrative_area_level_1',
            country: '#address_country',
            postal_code: '#address_postal_code'
        }
    });

    function showCallback(geocodeResult, parsedGeocodeResult){
        $('#callback_result').text(JSON.stringify(parsedGeocodeResult, null, 4));
    }

});
