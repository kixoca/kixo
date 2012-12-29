class Taxonomy < ActiveRecord::Base
  include CommonScopes

  attr_accessible :parent_id

  # a taxonomy can belong to a parent taxonomy
  belongs_to :parent, :class_name => "Taxonomy", :foreign_key => "parent_id"

  # a taxonomy can have one or many children taxomonies
  has_many :children, :class_name => "Taxonomy"

  # a taxonomy has one or many names (in different locales)
  has_many :names, :class_name => "TaxonomyName"

  # a taxonomy has one or many descriptions (in different locales)
  has_many :descriptions, :class_name => "TaxonomyDescription"

  # a taxonomy can classify many models
  has_many :users
  has_many :professionals
  has_many :representants
  has_many :questions
  has_many :guides

  def name(locale = nil)
    tax_name = self.names.by_locale(locale).first
    tax_name ? tax_name.name : nil
  end

  def description(locale = nil)
    tax_description = self.descriptions.by_locale(locale).first
    tax_description ? tax_description.description : nil
  end

  def self.find_by_name(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:taxonomy_names).where(:conditions => {:taxonomy_names => {:name => term, :locale_id => locale}})
  end

  def to_param
    "#{self.id}-#{self.name.parameterize}"
  end
end
