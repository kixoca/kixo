class Locality < Taxonomy

  attr_accessible :region

  # a locality (a.k.a. city) belongs to a region (which belongs to a country in turn)
  belongs_to :region, :foreign_key => :parent_id

  def population
    self.order
  end

  def self.find_by_name(name)
    locality_name = LocalityName.find_by_name(name)
    locality = locality_name ? locality_name.locality : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:locality_names).where(:conditions => {:locality_names => {:name => term, :locale_id => locale}})
  end

  def self.sort_by_name
    self.sort_by(&:name)
  end

  def self.sort_by_population
    self.order("rank DESC")
  end

  def self.most_populated(n = 10)
    self.sort_by_population.limit(n)
  end

end
