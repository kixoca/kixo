class Locale < ActiveRecord::Base

  # I18n
  has_many :users
  has_many :professionals
  has_many :representants
  has_many :questions
  has_many :guides
  has_many :reviews

end
