module CommonScopes
  def self.included(base)
    base.scope :by_locale, lambda {|*arg|
      locale = Locale.find_by_code(arg.first || I18n.locale)
      {:conditions => {:locale_id => locale ? locale.id : 0}}
    }
  end
end