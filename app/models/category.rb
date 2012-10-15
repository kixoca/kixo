class Category < ActiveRecord::Base

  attr_accessible :slug, :name, :description, :parent_id

  has_many   :child,  :class_name => "Category", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"

end
