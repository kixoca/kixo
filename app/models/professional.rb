class Professional < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid,
                  :name, :tel, :street_address_1, :street_address_2, :locality, :region, :postal_code, :country,
                  :headshot, :topic_ids, :profession_ids, :locale_id

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

  # I18n
  belongs_to :locale
  has_and_belongs_to_many :locales

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :large => "150x150>", :medium => "100x100>", :thumb => "50x50>" }

  # track versions with paper trail
  has_paper_trail

  # geocoding
  geocoded_by :full_address
  after_validation :geocode

  # set default values on init
  after_initialize :default_values

  # validation
  validates :email,    :presence => true
  validates :name,     :presence => true
  validates :locality, :presence => true
  validates :region,   :presence => true
  validates :country,  :presence => true
  validates_existence_of :locale

  def full_address
    "#{self.street_address_1}, #{self.locality}, #{self.region} #{self.postal_code}, #{self.country}"
  end

  def short_address
    "#{self.locality}, #{self.region}"
  end

  def topics_list
    self.topics.pluck("name").join(", ")
  end

  def professions_list
    self.professions.pluck("name").join(", ")
  end

  # search method
  def self.lookup(name)
    Professional.all(:conditions => ["name like ?", "%#{term}%"])
  end

  # find method
  def self.search(what, where)
    what_query = Professional.all(:include => [:topics, :professions], :conditions => ["topics.id in (?) or professions.id in (?)", Topic.search(what), Profession.search(what)])
    where_query = Professional.near(where, 50).order("distance")
    what_query & where_query
  end

  def can_answer?(question)
    self.topics.all(:conditions => {:id => question.topics.pluck("id")}).count > 0
  end

  # find similar professionals
  def similar
    what = self.professions.first.name
    where = self.full_address
    Professional.search(what, where)
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  private

  def default_values
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
