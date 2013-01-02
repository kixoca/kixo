class RegionName < TaxonomyName
  attr_accessible :region

  # a region name belongs to a region
  belongs_to :region, :foreign_key => :taxonomy_id

  # validation
  validates_existence_of :region
end
