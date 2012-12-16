class CategoryDescription < ActiveRecord::Base
  include CommonScopes

  attr_accessible :description, :locale_id, :category_id

  # a category description belongs to a locale
  belongs_to :locale

  # a category description belongs to a category
  belongs_to :category

  # validation
  validates :description, :presence => true
  validates_existence_of :locale
  validates_existence_of :category
end
