class Topic < ActiveRecord::Base

  attr_accessible :slug, :name, :description

  # a topic belongs in a category
  belongs_to :category

  # a topic is associated with one or many questions
  has_and_belongs_to_many :questions

end
