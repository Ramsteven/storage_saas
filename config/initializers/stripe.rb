Rails.configuration.stripe = {
  :publisehable_key => ENV['PUNISHEABLE_KEY'],
  :secret_key => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
