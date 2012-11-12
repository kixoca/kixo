Geocoder.configure do |config|

  # geocoding service
  config.lookup = :freegeoip

  # geocoding service request timeout, in seconds (default 3):
  config.timeout = 5

  # set default units to kilometers:
  config.units = :km

end