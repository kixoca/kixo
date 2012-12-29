class ProfessionName < TaxonomyName
  include CommonScopes

  # a profession name belongs to a profession
  belongs_to :profession, :foreign_key => "taxonomy_id"

  # validation
  validates_existence_of :profession

  def self.search(term, locale = nil)
    ProfessionName.by_locale(locale).all(:conditions => ["name like ?", "%#{term}%"])
  end
end
