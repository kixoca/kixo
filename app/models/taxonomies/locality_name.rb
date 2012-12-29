class LocalityName < TaxonomyName
  include CommonScopes

  # a locality name belongs to a locality
  belongs_to :locality, :foreign_key => "taxonomy_id"

  # validation
  validates_existence_of :locality

  def self.search(term, locale = nil)
    LocalityName.by_locale(locale).all(:conditions => ["name like ?", "%#{term}%"])
  end
end
