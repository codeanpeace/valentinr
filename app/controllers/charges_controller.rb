class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 999

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken],
      :plan => "valentinr-paid"
    )
    current_user.stripe_id = customer.id
    current_user.subscriber = true

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end
end