class Topic < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description, :category_id, :locale_id

  # a topic belongs in a category
  belongs_to :category

  # a topic is associated with one or many questions
  has_and_belongs_to_many :questions

  # a topic is associated with one or many professionals
  has_and_belongs_to_many :professionals

  # I18n
  belongs_to :locale

  # set default values on init
  after_initialize :default_values

  # validation
  validates :name, :presence => true
  validates_existence_of :category
  validates_existence_of :locale

  # search method
  def self.search(term)
    Topic.all(:conditions => ["name like ?", "%#{term}%"])
  end

  def to_param
    "#{name.parameterize}"
  end

  private

  def default_values
    self.locale = Locale.find_by_code(I18n.locale) if self.locale.nil?
  end

end
