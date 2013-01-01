class User < ActiveRecord::Base
  include CommonScopes

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :tel, :headshot, :bio, :locales, :locale_ids, :locale, :locale_id,
                  :street_address_1, :street_address_2, :locality, :locality_id, :region, :region_id, :postal_code, :country, :country_id,
                  :notify_of_kixo_news?, :notify_of_partner_news?, :notify_of_new_messages?, :notify_of_answers?, :notify_of_replies?, :notify_of_similar_questions?

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # localization
  has_many :localizations, :as => :localizable, :foreign_key => :localizable_id, :dependent => :destroy
  has_many :locales, :through => :localizations

  # location
  belongs_to :country
  belongs_to :region
  belongs_to :locality

  # a user can have one or many questions
  has_many :questions, :as => :author

  # a user can be the author of many reviews
  has_many :reviews, :as => :author

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :large => "160x160", :medium => "120x120", :small => "80x80", :thumb => "50x50" }

  # a user might belong to its referer (another user)
  belongs_to :referer, :polymorphic => true

  # a user can be the referer of one or many other users (users, professionals, representants)
  has_many :users,         :as => :referer
  has_many :professionals, :as => :referer
  has_many :representants, :as => :referer

  # set default values on init
  after_initialize :default_values

  # geocoding
  geocoded_by :full_address
  after_validation :geocode

  # validation
  validates :email, :presence => true
  validates_existence_of :locality
  validates_existence_of :region
  validates_existence_of :country
  validates_existence_of :locales

  def short_address
    "#{self.locality.name}, #{self.region.name}"
  end

  def full_address
    "#{self.street_address_1} (#{self.street_address_2}), #{self.locality.name}, #{self.region.name} #{self.postal_code}, #{self.country.name}"
  end

  def can_review?(professional)
    self.reviews.all(:conditions => {:professional_id => professional.id}).count == 0
  end

  def self.find_by_locality(locality)
    self.where(:conditions => {:locality => {:id => locality}})
  end

  def self.search_by_locality(locality)
    self.find_by_locality(Locality.search(locality))
  end

  private

  def default_values
    self.locales << Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id == 0)
  end

end
