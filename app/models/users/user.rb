class User < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :tel, :headshot, :bio,
                  :notify_of_kixo_news?, :notify_of_partner_news?, :notify_of_new_messages?, :notify_of_answers?,
                  :notify_of_replies?, :notify_of_similar_questions?

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # a user has a main locale
  belongs_to :locale

  # a user can understand many locales
  has_many :locales, :through => :localizations

  # a user can have one or many questions
  has_many :questions, :as => :author

  # a user can be the author of many reviews
  has_many :reviews, :as => :author

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => {:large => "160x160", :medium => "120x120", :small => "80x80", :thumb => "50x50"}

  # a user might belong to its referer (another user)
  belongs_to :referer, :polymorphic => true

  # a user can be the referer of one or many other users (users, professionals, representants)
  has_many :users,         :as => :referer
  has_many :professionals, :as => :referer
  has_many :representants, :as => :referer

  # set default values on init
  after_initialize :default_values

  # validation
  validates :email, :presence => true
  validates_existence_of :country
  validates_existence_of :region
  validates_existence_of :locality
  validates_existence_of :locale

  def short_address
    "#{self.locality.name}, #{self.region.name}"
  end

  def full_address
    "#{self.locality.name}, #{self.region.name} #{self.postal_code}, #{self.country.name}"
  end

  def self.find_all_by_locale(locale = Locale.find_by_code(I18n.locale))
    self.joins(:locales).where(:conditions => {:locale => {:id => locale}})
  end

  def can_review?(professional)
    self.reviews.all(:conditions => {:professional_id => professional}).count == 0 and
        self != professional
  end

  def is_a_regular_user?
    self.type == "User"
  end

  def is_a_professional?
    self.type == "Professional"
  end

  def is_a_representant?
    self.type == "Representant"
  end

  private

  def default_values
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
    self.locales << self.locale if (self.locales.nil? or self.locale_ids.blank?)
  end
end
