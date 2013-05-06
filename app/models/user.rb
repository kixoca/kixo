class User < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  acts_as_paranoid

  attr_accessor :card, :clear_topics, :clear_professions, :country, :country_id, :region, :region_id

  attr_accessible :email, :password, :password_confirmation, :is_active, :remember_me,
                  :name, :headshot, :bio, :is_a_professional, :website, :twitter, :facebook, :google_plus, :linkedin, :tel,
                  :street_address_1, :street_address_2, :locality, :locality_id, :postal_code,
                  :topics, :topic_ids, :professions, :profession_ids, :clear_topics, :clear_professions,
                  :notify_of_kixo_news, :notify_of_partner_news, :notify_of_new_messages, :notify_of_answers, :notify_of_replies, :notify_of_similar_questions, :notify_of_questions, :notify_of_other_answers,
                  :card,
                  :deleted_at

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # set default values on init
  after_initialize :default_values

  before_destroy :deactivate

  # sync stripe customer
  before_create  :create_stripe_customer
  before_update  :update_stripe_customer

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
                    :styles => {:large => "160x160#", :medium => "120x120#", :small => "80x80#", :thumb => "50x50#", :mini => "30x30#"},
                    :path => "/headshots/:id/:style.:extension",
                    :default_url => "/headshots/defaults/:style.png"

  # validation
  validates :email,    :presence => true
  validates :name,     :presence => true, :if => :is_a_professional?
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

  def public_name
    if is_a_professional?
      name.blank? ? t("users.misc.default_public_name") : name
    else
      I18n.t("users.misc.default_public_name")
    end
  end

  def display_name
    name.blank? ? email : name
  end

  def short_address
    "#{locality.name}, #{locality.region.name}"
  end

  def full_address
    "#{locality.name}, #{locality.region.name} #{postal_code}, #{locality.region.country.name}"
  end

  def topics_list
    topics.map {|topic| topic.name}.join(", ").html_safe
  end

  def professions_list
    professions.map {|profession| profession.name}.join(", ").html_safe
  end

  def destroy_classifications(type = nil)
    Classification.destroy_all(:classifiable_id => self.id, :classifiable_type => "User", :taxonomy_type => type)
  end

  def can_answer?(question)
    question.is_open? and !topics.merge(question.topics).empty? and answers.merge(question.answers).empty?
  end

  def can_review?(professional)
    professional.is_a_professional? and reviews.all(:conditions => {:professional_id => professional}).count == 0 and self != professional
  end

  def similar_professionals
    (User.find_all_by_topic(topics) + User.find_all_by_profession(professions)) &
        User.where(["id != ?", self.id]).near(geocoding_address, 50).order("distance") &
        User.professionals
  end

  def points
    46
  end

  def card
  end

  def stripe_customer
    Stripe::Customer.retrieve(stripe_customer_id)
  end

  def deactivate
    update_attributes(:is_active => false)
  end

  def active_for_authentication?
    super && is_active && !deleted_at
  end

  def welcome_by_email
    UserMailer.welcome_email(self).deliver
  end

  def goodbye_by_email
    UserMailer.goodbye_email(self).deliver
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
    locale ||= Locale.find_by_code(I18n.locale)
    locales << locale if (locales.empty? or locale_ids.blank?)
  end

  def self.authenticate(email, password)
    user = self.find_for_authentication(:email => email)
    user.valid_password?(password) ? user : nil
  end

  def create_stripe_customer
    customer = Stripe::Customer.create(:email => email)
    stripe_customer_id = customer.id
  end

  def update_stripe_customer
    customer = self.stripe_customer

    if customer
      if email != customer.email
        customer.email = email
        modified = true
      end

      if card
        customer.card = card
        modified = true
      end

      customer.save if modified
    end
  end

  def delete_stripe_customer
    customer = self.customer
    customer.delete if customer
  end
end
