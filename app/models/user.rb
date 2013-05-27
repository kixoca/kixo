class User < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  acts_as_paranoid

  attr_accessor :card, :clear_topics, :clear_professions, :country, :country_id, :country_name, :region, :region_id, :region_name, :locality_name

  attr_accessible :email, :password, :password_confirmation, :is_active, :remember_me,
                  :name, :headshot, :bio, :is_professional, :website, :twitter, :facebook, :google_plus, :linkedin, :tel,
                  :street_address_1, :street_address_2, :locality, :locality_id, :locality_name, :postal_code,
                  :points,
                  :topics, :topic_ids, :professions, :profession_ids, :clear_topics, :clear_professions,
                  :notify_of_kixo_news, :notify_of_partner_news, :notify_of_new_messages, :notify_of_answers, :notify_of_replies, :notify_of_similar_questions, :notify_of_questions, :notify_of_other_answers,
                  :plan, :card,
                  :deleted_at

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # set default values on init
  after_initialize :set_default_values

  # before save, set the 'is_professional' attribute based on the plan
  before_save :set_is_professional

  # make sure website has http(s)://
  before_save :sanitize_website
  before_save :sanitize_tel

  # set locality id based on locality name
  before_validation :set_locality_by_name

  before_destroy :deactivate

  # sync stripe customer
  before_create  :create_stripe_customer
  before_update  :update_stripe_customer

  # mixpanel user unique id
  before_create :create_mixpanel_id

  before_create :welcome_by_email
  before_destroy :goodbye_by_email

  # classifications
  has_many :topics,      :through => :classifications, :as => :classifiable, :source => :taxonomy, :source_type => "Topic"
  has_many :professions, :through => :classifications, :as => :classifiable, :source => :taxonomy, :source_type => "Profession"

  has_many :categories,  :through => :topics
  has_many :categories,  :through => :professions

  # a user has a main locale
  belongs_to :locale

  # a user can understand many locales
  has_many :locales, :through => :localizations

  # a user has a locality (geolocalizable)
  belongs_to :locality

  # a user can have one or many notifications
  has_many :notifications

  # a user can be a participant in one or many conversations
  has_many :conversation_participations, :foreign_key => :participant_id
  has_many :conversations, :through => :conversation_participations

  # a user can have one or many messages through conversations
  has_many :messages, :through => :conversations

  # a user can have one or many questions
  has_many :questions, :foreign_key => :author_id

  # a user can be the author of many answers
  has_many :answers, :foreign_key => :author_id

  # a user can be the author of one or many comments
  has_many :comments, :foreign_key => :author_id

  # a user can be the author or recipient of many reviews
  has_many :reviews, :foreign_key => :author_id
  has_many :reviews, :foreign_key => :professional_id

  # a user can be the author of one or many guides
  has_many :guides, :foreign_key => :author_id

  # a user might belong to its referer (another user)
  belongs_to :referer, :class_name => "User", :counter_cache => true

  # a user can be the referer of one or many other users (users, professionals, representants)
  has_many :referrals, :class_name => "User", :foreign_key => :referer_id

  # use paperclip to attach an headshot
  has_attached_file :headshot,
                    :styles => {:large => "200x200#", :medium => "140x140#", :small => "100x100#", :thumb => "80x80#", :mini => "60x60#"},
                    :path => "/headshots/:id/:style.:extension",
                    :default_url => "/headshots/defaults/:style.png"

  # validation
  validates :email,    :presence => true
  validates :name,     :presence => true
  validates :locality, :presence => true
  validates :locale,   :presence => true

  def self.find_all_by_locale(locale = Locale.find_by_code(I18n.locale))
    self.joins(:locales).where(:conditions => {:locale => {:id => locale}})
  end

  def self.rank
    self.order("id DESC")
  end

  def self.lookup(name)
    self.where(["name LIKE ?", "%#{name}%"])
  end

  def self.professionals
    self.where("plan in (?)", ["professional", "visibility"])
  end

  def self.search(what, where, locale = Locale.all)
    (self.search_by_topic(what, locale) + self.search_by_profession(what, locale)) & self.near(where, 50).order("distance")
  end

  def self.find_or_create_or_restore(user)
    existing_user = self.only_deleted.find_by_email(user[:email])

    if existing_user
      existing_user.restore!
      new_user = existing_user
      new_user.update_attributes(user)
    else
      new_user = self.find_or_create_by_email(user)
    end

    new_user
  end

  def self.authenticate(email, password)
    user = self.find_for_authentication(:email => email)
    user.valid_password?(password) ? user : nil
  end

  def is_professional?
    self.is_professional
  end

  def is_admin?
    self.is_admin
  end

  def short_address
    "#{self.locality.name}, #{self.locality.region.name}"
  end

  def full_address
    addr = ""
    addr << "#{self.street_address_1}, " unless self.street_address_1.blank?
    addr << "#{self.street_address_2}, " unless self.street_address_2.blank?
    addr << "#{self.locality.name}, #{self.locality.region.name} #{self.postal_code}, #{self.locality.region.country.name}"
  end

  def location_changed?
    self.street_address_1_changed? || self.locality_id_changed?
  end

  def topics_list
    self.topics.map {|topic| topic.name}.join(", ").html_safe
  end

  def professions_list
    self.professions.map {|profession| profession.name}.join(", ").html_safe
  end

  def destroy_classifications(type = nil)
    Classification.destroy_all(:classifiable_id => self.id, :classifiable_type => "User", :taxonomy_type => type)
  end

  def can_answer?(question)
    question.is_open? && self.is_professional?
  end

  def can_review?(professional)
    professional.is_professional? and reviews.all(:conditions => {:professional_id => professional}).count == 0 and self != professional
  end

  def similar_professionals
    (User.find_all_by_topic(self.topics) + User.find_all_by_profession(self.professions)) &
        User.where(["id != ?", self.id]).near(self.geocoding_address, 50).order("distance") &
        User.professionals
  end

  def welcome_by_email
    UserMailer.welcome_email(self).deliver
  end

  def goodbye_by_email
    UserMailer.goodbye_email(self).deliver
  end

  def deactivate
    self.update_attributes(:is_active => false)
  end

  def stripe_customer
    unless Stripe.api_key.blank?
      Stripe::Customer.retrieve(self.stripe_customer_id)
    end
  end

  def create_stripe_customer
    unless Stripe.api_key.blank?
      customer = Stripe::Customer.create(:email => self.email, :plan => self.plan)
      self.stripe_customer_id = customer.id
    end
  end

  def update_stripe_customer
    unless Stripe.api_key.blank?
      customer = self.stripe_customer

      if customer
        modified = false

        if self.email != customer.email
          customer.email = self.email
          modified = true
        end

        if self.card
          customer.card = self.card
          modified = true
        end

        if customer.subscription && self.plan != customer.subscription.plan.id
          customer.update_subscription(:plan => self.plan, :prorate => true)
          modified = true
        end

        customer.save if modified
      end
    end
  end

  def delete_stripe_customer
    unless Stripe.api_key.blank?
      customer = self.stripe_customer
      customer.delete if customer
    end
  end

  def has_active_card?
    unless Stripe.api_key.blank?
      self.stripe_customer.active_card
    end
  end

  def to_param
    if self.is_professional?
      "#{id}-#{name.parameterize}"
    else
      "#{id}"
    end
  end

  private

  def set_default_values
    self.locale  = Locale.find_by_code(I18n.locale) if self.locale.blank?
    self.locales << self.locale if (self.locales.empty? or self.locale_ids.blank?)
    self.plan    = "personal" if self.plan.blank?
    return true
  end

  def set_is_professional
    self.is_professional = ["professional", "visibility"].include?(self.plan)
    return true
  end

  def sanitize_website
    unless self.website.blank? || (self.website.include?("http://") || self.website.include?("https://"))
      self.website = "http://" + self.website
    end
  end

  def sanitize_tel
    unless self.tel.blank?
      self.tel = self.tel.gsub(/\D/, "")
    end
  end

  def set_locality_by_name
    unless self.locality_name.blank?
      locality = Locality.find_by_name(self.locality_name)
      self.locality_id = locality.id unless locality.nil?
    end
  end

  def create_mixpanel_id
    begin
      self.mixpanel_id = SecureRandom.hex(16)
    end while self.class.exists?(:mixpanel_id => self.mixpanel_id)
  end
end
