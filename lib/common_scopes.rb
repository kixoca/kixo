module CommonScopes
  def self.included(base)
    base.class_eval do
      named_scope :by_locale, lambda {|*locale| {:conditions => {:locale => locale.first || I18n.locale}}}
    end
  end
end