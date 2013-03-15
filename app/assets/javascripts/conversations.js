(function() {

    jQuery(function() {

        // Create conversations with modal windows

        var $newConversationTrigger = $('.new_conversation_trigger');
        var $newConversationModal = $('#new_conversation_modal');
        var $newConversationParticipantId = $('#new_conversation_participant_id');

        $newConversationTrigger.click(function(event) {
            event.preventDefault();
            var $this = $(this);
            var participantId = $this.data('participant-id');
            $newConversationParticipantId.val( participantId );
            return $newConversationModal.reveal();
        });


        // Mark messages 'in view' as read

        var $messages = $('.message');
        var $unreadMessages = $messages.filter('.unread');

        $unreadMessages.bind('inview', function(event, isInView) {
            if ( isInView ) {
                var $message = $(this);
                $.ajax({
                    type: 'GET',
                    url: $message.data('url'),
                    success: function(data) {
                        $message.animate({backgroundColor: '#FFFFFF'}, 1000).removeClass('unread').addClass('read');
                    }
                });
            }
        });

    });

}).call(this);
