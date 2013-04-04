$(document).ready(function(){

    $('form#new_comment')
        .bind("ajax:beforeSend", function(evt, xhr, settings){
            var $form = $(this);
            var $submitButton = $(this).find('input[name="commit"]');

            // Update the text of the submit button to let the user know stuff is happening.
            // But first, store the original text of the submit button, so it can be restored when the request is finished.
            $submitButton.data( 'original-text', $(this).text() );
            if ( $form.data('loading-text') ) {
                $submitButton.text( $form.data('loading-text') );
            }
        })
        .bind("ajax:success", function(evt, data, status, xhr){
            var $form = $(this);

            // Reset fields and any validation errors, so form can be used again, but leave hidden_field values intact.
            $form.find('textarea, input[type="text"], input[type="file"]').val("");
            $form.find('div.validation-error').empty();

            // Insert response partial into page below the form.
            $form.closest('.comments').append('<li>' + xhr.responseText + '</li>');
        })
        .bind('ajax:complete', function(evt, xhr, status){
            var $form = $(this);
            var $submitButton = $form.find('input[name="commit"]');

            // Restore the original submit button text
            $submitButton.text( $submitButton.data('original-text') );
        })
        .bind("ajax:error", function(evt, xhr, status, error){
            var $form = $(this),
                errors,
                errorText;

            try {
                // Populate errorText with the comment errors
                errors = $.parseJSON(xhr.responseText);
            } catch(err) {
                // If the responseText is not valid JSON (like if a 500 exception was thrown), populate errors with a generic error message.
                errors = {message: "Please reload the page and try again"};
            }

            // Build an unordered list from the list of errors
            errorText = "<ul>";

            for ( error in errors ) {
                errorText += "<li>" + error + ': ' + errors[error] + "</li> ";
            }

            errorText += "</ul>";

            // Insert error list into form
            $form.find('div.validation-error').html(errorText);
        });

});