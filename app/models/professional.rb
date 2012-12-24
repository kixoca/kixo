class Professional < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid,
                  :name, :tel, :street_address_1, :street_address_2, :locality_id, :region_id, :postal_code, :country_id,
                  :headshot, :bio, :topic_ids, :profession_ids, :representant_id, :locale_id

  # a professional is associated with one or many topics
  has_and_belongs_to_many :topics

  # a professional is associated with one or many professions
  has_and_belongs_to_many :professions

  # a professional can be the author of one or many guides
  has_many :guides

  # a professional can have one or many answers
  has_many :answers

  # a professional can have one or many reviews
  has_many :reviews, :dependent => :destroy

  # a professional belongs to a representant
  belongs_to :representant

  # location
  belongs_to :country
  belongs_to :region
  belongs_to :locality

  # I18n
  belongs_to :locale
  has_and_belongs_to_many :locales

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :large => "160x160", :medium => "120x120", :small => "80x80", :thumb => "50x50" }

  # track versions with paper trail
  has_paper_trail

  # geocoding
  geocoded_by :full_address
  after_validation :geocode

  # set default values on init
  after_initialize :default_values

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

  def short_address
    "#{self.locality.name}, #{self.region.name}"
  end

  def topics_list
    topic_names = Array.new
    self.topics.each do |topic|
      topic_names << topic.name
    end
    topic_names.join(", ")
  end

  def professions_list
    profession_names = Array.new
    self.professions.each do |profession|
      profession_names << profession.name
    end
    profession_names.join(", ")
  end

  def self.rank
    self.order("id DESC")
  end

  def self.lookup(name)
    self.where(:conditions => ["name like ?", "%#{term}%"])
  end

  def self.find_by_topic(topic)
    self.joins(:topics).where(:conditions => {:topics => {:id => topic}})
  end

  def self.search_by_topic(topic)
    self.find_by_topic(Topic.search(topic))
  end

  def self.find_by_profession(profession)
    self.joins(:professions).where(:conditions => {:professions => {:id => profession}})
  end

  def self.search_by_profession(profession)
    self.find_by_profession(Profession.search(profession))
  end

  def self.find_by_locality(locality)
    self.where(:conditions => {:locality_id => locality})
  end

  def self.search_by_locality(locality)
    self.find_by_locality(Locality.search(locality))
  end

  def self.search(what, where)
    what_query = self.search_by_topic(what) or self.search_by_profession(what)
    where_query = self.near(where, 50).order("distance")
    what_query + where_query
  end

  def can_answer?(question)
    question_status_test = question.is_open?
    topics_test = self.topics.where(:conditions => {:id => question.topics.pluck("id")}).count > 0
    question_status_test && topics_test
  end

  # find similar professionals
  def similar
    similar_topics = Professional.find_by_topic(self.topics)
    similar_professions = Professional.find_by_profession(self.professions)
    similar_location = Professional.near(self.full_address, 50).order("distance")
    (similar_topics or similar_professions) and similar_location
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def default_values
    self.locale = Locale.find_by_code(I18n.locale) if self.locale.nil?
  end
end
