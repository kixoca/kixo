class Representant < User
  # validation
  validates :name,        :presence => true
  validates :postal_code, :presence => true
end
