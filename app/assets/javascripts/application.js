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

});
