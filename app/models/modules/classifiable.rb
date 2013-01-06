module Classifiable
  def self.included(base)
    base.has_many :classifications, :as => :classifiable, :foreign_key => :classifiable_id, :dependent => :destroy

    def base.find_all_by_category(category)
      self.joins(:categories).where(:conditions => {:taxonomies => {:id => category}})
    end

    def base.find_all_by_topic(topic)
      self.joins(:topics).where(:conditions => {:taxonomies => {:id => topic}})
    end

    def base.find_all_by_profession(profession)
      self.joins(:professions).where(:conditions => {:taxonomies => {:id => profession}})
    end

    def base.search_by_category(term, locale = Locale.find_by_code(I18n.locale))
      self.find_all_by_category(Category.search(term, locale))
    end

    def base.search_by_topic(term, locale = Locale.find_by_code(I18n.locale))
      self.find_all_by_topic(Topic.search(term, locale))
    end

    def base.search_by_profession(term, locale = Locale.find_by_code(I18n.locale))
      self.find_all_by_profession(Profession.search(term, locale))
    end
  end
end