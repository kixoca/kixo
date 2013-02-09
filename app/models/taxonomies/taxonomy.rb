class Taxonomy < ActiveRecord::Base
  attr_accessible :parent, :parent_id, :rank

  # a taxonomy has one or many names (in different locales)
  has_many :names, :class_name => "TaxonomyName", :foreign_key => :taxonomy_id

  # a taxonomy has one or many descriptions (in different locales)
  has_many :descriptions, :class_name => "TaxonomyDescription", :foreign_key => :taxonomy_id

  # a taxonomy can belong to a parent taxonomy
  belongs_to :parent, :class_name => "Taxonomy"

  # a taxonomy can have one or many children taxomonies
  has_many :children, :class_name => "Taxonomy", :foreign_key => :parent_id

  # a taxonomy can classify many models
  has_many :classifications, :as => :taxonomy, :foreign_key => :taxonomy_id
  has_many :classifiables, :through => :classifications, :source => :classifiable
  has_many :users,         :through => :classifications, :source => :classifiable, :source_type => "User"
  has_many :professionals, :through => :classifications, :source => :classifiable, :source_type => "User", :conditions => {:is_a_professional => true}
  has_many :questions,     :through => :classifications, :source => :classifiable, :source_type => "Question"
  has_many :guides,        :through => :classifications, :source => :classifiable, :source_type => "Guide"

  def name(locale = Locale.find_by_code(I18n.locale))
    tax_name = self.names.find_by_locale(locale)
    tax_name.name unless tax_name.nil?
  end

  def description(locale = Locale.find_by_code(I18n.locale))
    tax_description = self.descriptions.find_by_locale(locale)
    tax_description.description unless tax_description.nil?
  end

  def self.find_by_name(name, locale = Locale.find_by_code(I18n.locale))
    self.joins(:names).first(:conditions => {:taxonomy_names => {:name => name, :locale_id => locale}})
  end

  def self.search(term, locale = Locale.all)
    self.joins(:names).where(["lower(taxonomy_names.name) LIKE ? AND taxonomy_names.locale_id IN (?)", "%#{term.downcase}%", locale]).uniq
  end

  def self.sort_by_name
    self.sort_by(&:name)
  end

  def self.order_by_rank
    self.order("rank DESC")
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
