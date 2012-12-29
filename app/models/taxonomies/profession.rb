class Profession < Taxonomy
  include CommonScopes

  # a profession has many names (in different locales)
  has_many :names, :class_name => "ProfessionNames"

  # a profession has many descriptions (in different locales)
  has_many :descriptions, :class_name => "ProfessionDescription"

  # a profession belongs in a category
  belongs_to :category, :foreign_key => "parent_id"

  def self.find_by_name(name)
    profession_name = ProfessionName.find_by_name(name)
    profession = profession_name ? profession_name.profession : nil
  end

  def self.search(term, locale = Locale.find_by_code(I18n.locale))
    self.joins(:profession_names).where(:conditions => {:profession_names => {:name => term, :locale_id => locale}})
  end
end
