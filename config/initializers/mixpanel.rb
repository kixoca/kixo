if Rails.env.production?

  MIXPANEL_TOKEN = "6285a86836087dca7d648ef664f7c751"

elsif Rails.env.development?

  MIXPANEL_TOKEN = "0a527f6adf896f6c19277a0d138f0f1e"

elsif Rails.env.test?

  # test

else

  # ???

end