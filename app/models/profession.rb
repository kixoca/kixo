class Profession < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :description, :category_id

  # a profession belongs in a category
  belongs_to :category

  # a profession is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # validation
  validates :name, :presence => true
  validates_existence_of :category

  # search method
  def self.search(term)
    Profession.all(:conditions => ["name like ?", "%#{term}%"])
  end

  def to_param
    "#{name.parameterize}"
  end
end
