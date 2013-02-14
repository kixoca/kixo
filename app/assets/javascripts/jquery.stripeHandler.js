$(function() {
    Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );

    $('form.stripe').submit(function(e) {
        var $form = $(this);

        $form.find('.submit').prop('disabled', true);

        Stripe.createToken({
            number:    $form.find('#card_number').val(),
            cvc:       $form.find('#card_cvc').val(),
            exp_month: $form.find('#card_exp_month').val(),
            exp_year:  $form.find('#card_exp_year').val()
        }, stripeResponseHandler);

        return false;
    });
});

function stripeResponseHandler(status, response) {
    var $form = $('form.stripe');

    if (response.error) {
        // Show the errors on the form
        $form.find('.stripe-errors').text(response.error.message).removeClass('hidden');
        $form.find('.submit').prop('disabled', false);
    } else {
        $form.find('.stripe-errors').addClass('hidden');
        // token contains id, last4, and card type
        var token = response.id;
        // Insert the token into the form so it gets submitted to the server
        $form.find('#user_card').val(token);
        // and submit
        $form.get(0).submit();
    }
}