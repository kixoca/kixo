$(document).ready(function() {
    $(".autocomplete").each(function() {
        var $this = $(this);

        $this.typeahead({
            name:     $this.data('name')     || $this.attr('name'),
            prefetch: $this.data('prefetch') || null,
            template: $this.data('template') || null,
            header:   $this.data('header')   || null,
            footer:   $this.data('footer')   || null,
            limit:    $this.data('limit')    || 10
        });
    });
})