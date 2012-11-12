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

  # I18n
  belongs_to :locale

  # use paperclip to attach an headshot
  has_attached_file :headshot, :styles => { :medium => "300x300>", :thumb => "100x100>" }

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

  def profession_list
    list = []
    self.professions.each do |profession|
      list.push(profession.name)
    end
    list.join(", ")
  end

  # search method
  def self.search(term)
    Professional.all(:conditions => ["name like ?", "%#{term}%"])
  end

  # find method
  def self.find(what, where)
    what_query = Professional.all(:include => [:topics, :professions], :conditions => ["topics.id in (?) or professions.id in (?)", Topic.search(what), Profession.search(what)])
    where_query = Professional.near(where, 50).order("distance")
    what_query & where_query
  end

  private

  def default_values
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
