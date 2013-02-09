if Rails.env.production?

  # production

elsif Rails.env.development?

  Stripe.api_key = "sk_test_wGHdPaw7Wv3QKysBsNdQOk1X"
  STRIPE_PUBLIC_KEY = "pk_test_suGTLutkSr90556hUNdFoeRT"

elsif Rails.env.test?

  # test

else

  # ???

end