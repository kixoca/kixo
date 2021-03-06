class Taxonomy < ActiveRecord::Base
  # a taxonomy has one or many names (in different locales)
  has_many :names, :class_name => "TaxonomyName", :foreign_key => :taxonomy_id

  # a taxonomy has one or many descriptions (in different locales)
  has_many :descriptions, :class_name => "TaxonomyDescription", :foreign_key => :taxonomy_id

  # a taxonomy can belong to a parent taxonomy
  belongs_to :parent, :class_name => "Taxonomy"

  # a taxonomy can have one or many children taxomonies
  has_many :children, :class_name => "Taxonomy", :foreign_key => :parent_id

  has_attached_file :image

  attr_accessible :parent, :parent_id, :image, :rank

  attr_accessible :names_attributes
  accepts_nested_attributes_for :names, :allow_destroy => true, :reject_if => :all_blank

  attr_accessible :descriptions_attributes
  accepts_nested_attributes_for :descriptions, :allow_destroy => true, :reject_if => :all_blank

  def name(locale = Locale.find_by_code(I18n.locale))
    Rails.cache.fetch("Taxonomy.find(#{self.id}).name(#{locale})") {
      tax_name = self.names.find_by_locale(locale)
      tax_name.name unless tax_name.nil?
    }
  end

  def description(locale = Locale.find_by_code(I18n.locale))
    Rails.cache.fetch("Taxonomy.find(#{self.id}).description(#{locale})") {
      tax_description = self.descriptions.find_by_locale(locale)
      tax_description.description unless tax_description.nil?
    }
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

  def self.most_popular(n = 10)
    self.order("questions_count DESC, users_count DESC").limit(n)
  end

  def to_param
    if self.name
      "#{self.id}-#{self.name.parameterize}"
    else
      self.id
    end
  end
end
