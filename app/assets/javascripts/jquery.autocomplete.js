(function() {

    jQuery(function() {
        $( "input.autocomplete").each(function() {
            var $this = $(this);

            $this.autocomplete({
                source: function( request, response ) {
                    $.ajax({
                        url: $this.data( "source" ),
                        dataType: "json",
                        data: {
                            term: request.term
                        },
                        success: function( data ) {
                            response( $.map( data, function( item ) {
                                return {
                                    id:    item.id,
                                    label: item.label,
                                    value: item.name
                                }
                            }));
                        }
                    });
                },
                minLength: 2
            });
        });
    });

}).call(this);