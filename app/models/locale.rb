class Locale < ActiveRecord::Base

  attr_accessible :name, :code

  # I18n
  has_many :users
  has_many :professionals
  has_many :representants
  has_many :questions
  has_many :guides
  has_many :reviews
  has_many :category_names
  has_many :topic_names
  has_many :profession_names

  validates :name, :presence => true
  validates :code, :presence => true

end
