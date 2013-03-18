if Rails.env.production?

  Stripe.api_key = "sk_live_JTb7y5ACCpO3PP8CfyS3ZwIH"
  STRIPE_PUBLIC_KEY = "pk_live_2snYGks3tiyn9ogXHIig8mX9"

elsif Rails.env.development?

  Stripe.api_key = "sk_test_wGHdPaw7Wv3QKysBsNdQOk1X"
  STRIPE_PUBLIC_KEY = "pk_test_suGTLutkSr90556hUNdFoeRT"

elsif Rails.env.test?

  # test

else

  # ???

end