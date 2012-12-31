class CountryName < TaxonomyName

  attr_accessible :country

  # a country name belongs to a country
  belongs_to :country, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :country

  # search method
  def self.search(term, locale = nil)
    CountryName.by_locale(locale).all(:conditions => ["name like ?", "%#{term}%"])
  end

end
