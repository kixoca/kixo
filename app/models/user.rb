class User < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  attr_accessor :card, :clear_topics, :clear_professions

  attr_accessible :email, :password, :password_confirmation, :is_active, :remember_me,
                  :name, :headshot, :bio, :is_a_professional, :website, :twitter, :facebook, :google_plus, :linkedin, :tel,
                  :topics, :topic_ids, :professions, :profession_ids, :clear_topics, :clear_professions,
                  :notify_of_kixo_news, :notify_of_partner_news, :notify_of_new_messages, :notify_of_answers, :notify_of_replies, :notify_of_similar_questions, :notify_of_questions, :notify_of_other_answers,
                  :card,
                  :deleted_at

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # set default values on init
  after_initialize :default_values

  # sync stripe customer
  before_create  :create_stripe_customer
  before_update  :update_stripe_customer
  before_destroy :delete_stripe_customer

  before_create :welcome_by_email

  # classifications
  has_many :topics,      :through => :classifications, :as => :classifiable, :source => :taxonomy, :source_type => "Topic"
  has_many :professions, :through => :classifications, :as => :classifiable, :source => :taxonomy, :source_type => "Profession"

  has_many :categories,  :through => :topics
  has_many :categories,  :through => :professions

  # a user has a main locale
  belongs_to :locale

  # a user can understand many locales
  has_many :locales, :through => :localizations

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
                    :styles => {:large => "160x160#", :medium => "120x120#", :small => "80x80#", :thumb => "50x50#", :mini => "30x30#"},
                    :path => "/headshots/:id/:style.:extension",
                    :default_url => "/headshots/defaults/:style.png"

  # validation
  validates :email,    :presence => true
  validates :name,     :presence => true, :if => :is_a_professional?
  validates :country,  :presence => true
  validates :region,   :presence => true
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
    self.where(:is_a_professional => true)
  end

  def self.search(what, where, locale = Locale.all)
    (self.search_by_topic(what, locale) + self.search_by_profession(what, locale)) & self.near(where, 50).order("distance")
  end

  def public_name
    if self.is_a_professional?
      self.name.blank? ? t("users.misc.default_public_name") : self.name
    else
      t("users.misc.default_public_name")
    end
  end

  def display_name
    self.name.blank? ? self.email : self.name
  end

  def short_address
    "#{self.locality.name}, #{self.region.name}"
  end

  def full_address
    "#{self.locality.name}, #{self.region.name} #{self.postal_code}, #{self.country.name}"
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

  def is_a_professional?
    self.is_a_professional == true
  end

  def can_answer?(question)
    question.is_open? and
        !self.topics.merge(question.topics).empty? and
        self.answers.merge(question.answers).empty?
  end

  def can_review?(professional)
    professional.is_a_professional? and self.reviews.all(:conditions => {:professional_id => professional}).count == 0 and self != professional
  end

  def similar_professionals
    (User.find_all_by_topic(self.topics) + User.find_all_by_profession(self.professions)) &
        User.where(["id != ?", self.id]).near(self.geocoding_address, 50).order("distance") &
        User.professionals
  end

  def points
    46
  end

  def card
  end

  def customer
    Stripe::Customer.retrieve(self.stripe_customer_id)
  end

  def soft_delete
    update_attributes(:is_active => false, :deleted_at => Time.current)
  end

  def active_for_authentication?
    super && is_active
  end

  def to_param
    unless name.blank?
      "#{id}-#{name.parameterize}"
    else
      "#{id}"
    end
  end

  private

  def default_values
    self.locale ||= Locale.find_by_code(I18n.locale)
    self.locales << self.locale if (self.locales.empty? or self.locale_ids.blank?)
  end

  def self.authenticate(email, password)
    user = self.find_for_authentication(:email => email)
    user.valid_password?(password) ? user : nil
  end

  def create_stripe_customer
    customer = Stripe::Customer.create(:email => self.email)
    self.stripe_customer_id = customer.id
  end

  def update_stripe_customer
    customer = self.customer
    if customer
      if self.email != self.customer.email
        customer.email = self.email
        modified = true
      end

      if self.card
        customer.card = self.card
        modified = true
      end

      customer.save if modified
    end
  end

  def delete_stripe_customer
    customer = self.customer
    customer.delete if customer
  end

  def welcome_by_email
    UserMailer.welcome_email(self).deliver
  end
end
