class TaxonomyName < ActiveRecord::Base
  include Localizable

  attr_accessible :name, :locale, :locale_id, :taxonomy, :taxonomy_id, :taxonomy_type

  after_save    :expire_cache
  after_destroy :expire_cache

  # a taxonomy name belongs to a taxonomy
  belongs_to :taxonomy

  # a taxonomy name belongs to a locale
  belongs_to :locale

  # validation
  validates :name,     :presence => true
  validates :locale,   :presence => true
  validates :taxonomy, :presence => true

  def expire_cache
    Rails.cache.delete("#{self.taxonomy.class.name}.find(#{self.taxonomy.id}).name(#{self.locale.code})")
  end
end
