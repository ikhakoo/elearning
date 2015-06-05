Rails.configuration.stripe = {
  :publishable_key => ENV['sk_test_29bbZOJvBrCuhPV19kSPM3xo'],
  :secret_key      => ENV['pk_test_23bivOGoRo9IxET9EPB9R283']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]