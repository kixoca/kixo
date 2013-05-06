(function() {

    jQuery(function() {
        $("input.autocomplete").each(function() {
            var $this = $(this);

            $this.autocomplete({
                minLength: 2,
                source: function( request, response ) {
                    $.ajax({
                        url: $this.data("source"),
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
                select: function( event, ui ) {
                    var target = $this.data("target");
                    if ( target ) {
                        var $target = $(target);
                        if ( $target.size() > 0 ) {
                            $target.val( ui.item.id );
                        }
                    }
                }
            });
        });
    });

}).call(this);