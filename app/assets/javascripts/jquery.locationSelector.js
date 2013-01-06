/*
 * locationSelector
 *
 * @author Jonathan Roy <jonathan.roy@kixo.ca>
 * @version 0.1
 * @package kixo
 */

!function($) {

    $(function() {

        "use strict"; // jshint ;_;

        jQuery.fn.locationSelector = function() {

            return this.each(function() {

                var $this = $(this);
                var $country  = $this.find("select.country");
                var $region   = $this.find("select.region");
                var $locality = $this.find("select.locality");

                // handle enable/disable region and locality

                if ( $country.find(":selected").val() ) {
                    $country.removeAttr("disabled");
                    $region.removeAttr("disabled");

                    if ( $region.find(":selected").val() ) {
                        $locality.removeAttr("disabled");
                    } else {
                        $locality.attr("disabled", "disabled");
                    }
                } else {
                    $region.attr("disabled", "disabled");
                    $locality.attr("disabled", "disabled");
                }

                // append 'basket' selects

                $this.append('<select class="region_basket"></select>');
                $this.append('<select class="locality_basket"></select>');

                var $regionBasket = $this.find(".region_basket").hide();
                var $localityBasket = $this.find(".locality_basket").hide();

                $country.change(function() {

                    // enable region when country is selected

                    var $selectedCountry = $country.find("option:selected");

                    if ( $selectedCountry.val() ) {
                        $region.removeAttr("disabled")
                    }
                    else {
                        $region.attr("disabled", "disabled");
                        $locality.attr("disabled", "disabled");
                    }

                    // show only valid options for region and locality

                    var selectedCountryId = $selectedCountry.val();

                    $region.find("option").each(function(i) {
                        if ( i > 0 ) {
                            var $thisOption = $(this);
                            if ( $thisOption.data("country") != selectedCountryId ) $thisOption.remove().appendTo($regionBasket);
                        }
                    });

                    $regionBasket.find("option").each(function(i) {
                        var $thisOption = $(this);
                        if ( $thisOption.data("country") == selectedCountryId ) $thisOption.remove().appendTo($region);
                    });

                    $locality.find("option").each(function(i) {
                        if ( i > 0 ) {
                            var $thisOption = $(this);
                            if ( $thisOption.data("country") != selectedCountryId ) $thisOption.remove().appendTo($localityBasket);
                        }
                    });

                    $localityBasket.find("option").each(function(i) {
                        var $thisOption = $(this);
                        if ( $thisOption.data("country") == selectedCountryId ) $thisOption.remove().appendTo($locality);
                    });

                });

                $region.change(function() {

                    // enable locality when region is selected

                    var $selectedRegion = $region.find("option:selected");

                    $selectedRegion.val() ? $locality.removeAttr("disabled") : $locality.attr("disabled", "disabled");

                    // show only valid options for region

                    var selectedRegionId = $selectedRegion.val();

                    $locality.find("option").each(function(i) {
                        if ( i > 0 ) {
                            var $thisOption = $(this);
                            if ( $thisOption.data("region") != selectedRegionId ) $thisOption.remove().appendTo($localityBasket);
                        }
                    });

                    $localityBasket.find("option").each(function(i) {
                        var $thisOption = $(this);
                        if ( $thisOption.data("region") == selectedRegionId ) $thisOption.remove().appendTo($locality);
                    });

                });

            });

        };

    })

}(window.jQuery);