class User < ActiveRecord::Base
  include Localizable
  include Classifiable
  include Geolocalizable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :tel, :headshot, :bio, :is_a_professional,
                  :topics, :topic_ids, :professions, :profession_ids,
                  :notify_of_kixo_news?, :notify_of_partner_news?, :notify_of_new_messages?, :notify_of_answers?,
                  :notify_of_replies?, :notify_of_similar_questions?, :notify_of_questions?, :notify_of_other_answers?

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # classifications
  has_many :topics,      :through => :classifications, :source => :taxonomy, :source_type => "Topic"
  has_many :professions, :through => :classifications, :source => :taxonomy, :source_type => "Profession"

  # a user has a main locale
  belongs_to :locale

  # a user can understand many locales
  has_many :locales, :through => :localizations

  # a user can have one or many questions
  has_many :questions, :foreign_key => :author_id

  # a user can be the author of many answers
  has_many :answers, :foreign_key => :author_id

  # a user can be the author of many reviews
  has_many :reviews, :foreign_key => :author_id

  # a user can be the author of one or many guides
  has_many :guides, :foreign_key => :author_id

  # a user might belong to its referer (another user)
  belongs_to :referer, :class_name => "User"

  # a user can be the referer of one or many other users (users, professionals, representants)
  has_many :users, :foreign_key => :referer_id

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => {:large => "160x160", :medium => "120x120", :small => "80x80", :thumb => "50x50"}

  # set default values on init
  after_initialize :default_values

  # validation
  validates :email, :presence => true
  validates_existence_of :country
  validates_existence_of :region
  validates_existence_of :locality
  validates_existence_of :locale

  def self.find_all_by_locale(locale = Locale.find_by_code(I18n.locale))
    self.joins(:locales).where(:conditions => {:locale => {:id => locale}})
  end

  def self.rank
    self.order("id DESC")
  end

  def self.lookup(name)
    self.where(:conditions => ["name LIKE ?", "%#{name}%"])
  end

  def self.professionals
    self.where(:is_a_professional => true)
  end

  def self.search(what, where, locale = Locale.all)
    (self.search_by_topic(what, locale) + self.search_by_profession(what, locale)) & self.near(where, 50).order("distance")
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

  def can_answer?(question)
    question.is_open? and
        !self.topics.merge(question.topics).empty? and
        self.answers.merge(question.answers).empty?
  end

  def can_review?(user)
    self.reviews.all(:conditions => {:user_id => user}).count == 0 and
        self != user
  end

  def similar
    (User.find_all_by_topic(self.topics) or User.find_all_by_profession(self.professions)) and
        User.where(["id != ?", self.id]).near(self.geocoding_address, 50).order("distance")
  end

  def points
    46
  end

  def to_param
    unless name.blank?
      "#{id}-#{name.parameterize}"
    else
      "#{id}"
    end
  end

  private

  def self.authenticate(email, password)
    user = self.find_for_authentication(:email => email)
    user.valid_password?(password) ? user : nil
  end

  def default_values
    self.locale = Locale.find_by_code(I18n.locale) if (self.locale.nil? or self.locale_id.blank?)
    self.locales << self.locale if (self.locales.nil? or self.locale_ids.blank?)
  end
end
