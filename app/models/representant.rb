class Representant < ActiveRecord::Base

  validates :first_name, :presence => true
  validates :last_name,  :presence => true
  validates :tel,        :presence => true
  validates :email,      :presence => true

end
