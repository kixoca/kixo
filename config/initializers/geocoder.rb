Geocoder.configure do |config|

  # geocoding service
  #config.lookup = :google
  config.lookup = :bing

  config.api_key = "Aj0fPAKOX-39C8eDKfAqYMAc9suebbjx7AW2ZwQ7p6MOD-f9lngjPzNFdS3yeOUv"

  # geocoding service request timeout, in seconds (default 3):
  config.timeout = 5

  # set default units to kilometers:
  config.units = :km

end