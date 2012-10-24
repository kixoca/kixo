class Category < ActiveRecord::Base

  attr_accessible :slug, :name, :description, :parent_id

  # categories are hierarchical
  has_many   :child,  :class_name => "Category", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"

  # a category is linked to one or many professionals
  has_and_belongs_to_many :professionals

  # representants are assigned categories
  has_and_belongs_to_many :representants

end
