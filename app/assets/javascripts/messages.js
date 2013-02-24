(function() {

    jQuery(function() {
        var $newMessageTrigger = $('.new_message_trigger');
        var $newMessageModal = $('#new_message_modal');
        var $newMessageToName = $('#new_message_to_name');
        var $newMessageToId = $('#new_message_to_id');

        $newMessageTrigger.click(function(event) {
            event.preventDefault();

            var $this = $(this);
            var toName = $this.data('to-name');
            var toId = $this.data('to-id');

            $newMessageToName.val( toName );
            $newMessageToId.val( toId );

            $newMessageModal.reveal();
        });

        $newMessageToName.on('autocompleteselect', function(event, ui) {
            return $newMessageToId.val(ui.item.id);
        });
    });

}).call(this);
