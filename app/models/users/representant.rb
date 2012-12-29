class Representant < User
  include CommonScopes

  # validation
  validates :name,  :presence => true

end
