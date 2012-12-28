class Representant < User
  include CommonScopes

  # a representant has one or many professionals
  has_many :professionals

  # validation
  validates :name,  :presence => true

end
