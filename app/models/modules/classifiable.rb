module Classifiable
  def self.included(base)
    base.has_many :classifications, :as => :classifiable, :foreign_key => :classifiable_id, :dependent => :destroy
  end
end