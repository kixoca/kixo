class Representant < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :tel, :street_address_1, :street_address_2, :locality_id, :region_id, :postal_code, :country_id,
                  :headshot, :locale_id

  # a representant has one or many professionals
  has_many :professionals

  # location
  belongs_to :country
  belongs_to :region
  belongs_to :locality

  # I18n
  belongs_to :locale

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :large => "150x150", :medium => "100x100", :thumb => "50x50" }

  # geocoding
  geocoded_by :full_address
  after_validation :geocode

  # validation
  validates :email, :presence => true
  validates :name,  :presence => true
  validates_existence_of :locality
  validates_existence_of :region
  validates_existence_of :country
  validates_existence_of :locale

  def full_address
    "#{self.street_address_1}, #{self.locality.name}, #{self.region.name} #{self.postal_code}, #{self.country.name}"
  end

end
