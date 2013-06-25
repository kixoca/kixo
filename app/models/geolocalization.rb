class Geolocalization < ActiveRecord::Base
  attr_accessible :geolocalizable, :geolocalizable_id, :geolocalizable_type, :address, :address_id, :address_type

  belongs_to :geolocalizable, :polymorphic => true
  belongs_to :address

  validates_existence_of :geolocalizable
  validates_existence_of :address
end
