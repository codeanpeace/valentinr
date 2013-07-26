Rails.configuration.stripe = {
  :publishable_key => ENV['SP_PUBLISHABLE_KEY'],
  :secret_key      => ENV['SP_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]