class Topic < ActiveRecord::Base

  attr_accessible :name, :slug, :description, :category_id

  # a topic belongs in a category
  belongs_to :category

  # a topic is associated with one or many questions
  has_and_belongs_to_many :questions

end
