module Localizable
  def self.included(base)
    base.attr_accessible :locale, :locale_id,
                         :locales, :locale_ids

    base.has_many :localizations, :as => :localizable, :foreign_key => :localizable_id

    def base.find_by_locale(locale = Locale.find_by_code_cached(I18n.locale))
      self.first(:conditions => {:locale_id => locale})
    end

    def base.find_all_by_locale(locale = Locale.find_by_code_cached(I18n.locale))
      self.where({:locale_id => locale})
    end
  end
end