class User < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid,
                  :name, :tel, :street_address_1, :street_address_2, :locality, :region, :postal_code, :country,
                  :headshot, :locale_id

  # a user can have many questions
  has_many :questions

  # a user can be the author of many reviews
  has_many :reviews, :dependent => :destroy

  # I18n
  belongs_to :locale

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :large => "150x150", :medium => "100x100", :thumb => "50x50" }

  # set default values on init
  after_initialize :default_values

  # geocoding
  geocoded_by :full_address
  after_validation :geocode

  # validation
  validates :email,    :presence => true
  validates :locality, :presence => true
  validates :region,   :presence => true
  validates :country,  :presence => true
  validates_existence_of :locale

  def short_address
    "#{self.locality}, #{self.region}"
  end

  def full_address
    "#{self.street_address_1}, #{self.locality}, #{self.region} #{self.postal_code}, #{self.country}"
  end

  def can_review?(professional)
    self.reviews.all(:conditions => {:professional_id => professional.id}).count == 0
  end

  private

  def default_values
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
