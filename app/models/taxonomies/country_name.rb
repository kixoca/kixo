class CountryName < TaxonomyName
  attr_accessible :country

  # a country name belongs to a country
  belongs_to :country, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :country
end
