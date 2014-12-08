Rails.configuration.stripe = {
  :publishable_key => ENV.fetch('STRIPE_PUBLISHABLE_KEY', 'pk_test_dI40Jlo738p8quARStL3hpwW'),
  :secret_key      => ENV.fetch('STRIPE_SECRET_KEY', 'sk_test_Z0ExqmC5j2J1RYiOFTDKgm8m')
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]