class Category < ActiveRecord::Base

  attr_accessible :slug, :name, :description, :parent_id

  # a Category is hierarchical
  has_many   :child,  :class_name => "Category", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"

  # a category is linked to one or many businesses
  has_and_belongs_to_many :businesses

end
