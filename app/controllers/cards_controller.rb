class CardsController < ApplicationController

  before_filter :authenticate_user!

  def create
    card = Card.new(params[:card])

    if card.valid?
      card_token = Stripe::Token.create(:card => card)

      if card_token.valid?
        customer = current_user.customer
        customer.card = card_token
        customer.save
      end
    end

    redirect_to edit_user_registration_path
  end

end
