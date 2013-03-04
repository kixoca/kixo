(function() {

    jQuery(function() {
        var $newConversationTrigger = $('.new_conversation_trigger');
        var $newConversationModal = $('#new_conversation_modal');
        var $newConversationParticipantName = $('#new_conversation_participant_name');
        var $newConversationParticipantId = $('#new_conversation_participant_id');

        $newConversationTrigger.click(function(event) {
            event.preventDefault();

            var $this = $(this);
            var participantName = $this.data('participant-name');
            var participantId = $this.data('participant-id');

            $newConversationParticipantName.val( participantName );
            $newConversationParticipantId.val( participantId );

            return $newConversationModal.reveal();
        });

        $newConversationParticipantName.on('autocompleteselect', function(event, ui) {
            return $newConversationParticipantId.val(ui.item.id);
        });
    });

}).call(this);
