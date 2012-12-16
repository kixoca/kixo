class CategoryName < ActiveRecord::Base
  include CommonScopes

  attr_accessible :name, :locale_id, :category_id

  # a category name belongs to a locale
  belongs_to :locale

  # a category name belongs to a category
  belongs_to :category

  # validation
  validates :name, :presence => true
  validates_existence_of :locale
  validates_existence_of :category

  # search method
  def self.search(term)
    CategoryName.all(:conditions => ["name like ?", "%#{term}%"])
  end
end
