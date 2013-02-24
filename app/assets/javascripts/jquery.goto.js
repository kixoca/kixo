(function() {

    jQuery(function() {

        $('.goto').click(function(event) {
            var goto = $(this).data('goto');

            if ( goto ) {
                window.location = goto;
            }
        });

    });

}).call(this);
