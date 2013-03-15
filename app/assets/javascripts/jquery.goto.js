(function() {

    jQuery(function() {

        $('.goto').click(function(event) {
            var url = $(this).data('url');

            if ( url ) {
                window.location = url;
            }
        });

    });

}).call(this);
