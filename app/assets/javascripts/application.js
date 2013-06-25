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
            lat: "#lat",
            lng: "#lng",
            street_number: '#street_number',
            route: '#route',
            locality: '#locality',
            administrative_area_level_2: '#administrative_area_level_2',
            administrative_area_level_1: '#administrative_area_level_1',
            country: '#country',
            postal_code: '#postal_code',
            type: '#type'
        }
    });

    function showCallback(geocodeResult, parsedGeocodeResult){
        $('#callback_result').text(JSON.stringify(parsedGeocodeResult, null, 4));
    }

});
