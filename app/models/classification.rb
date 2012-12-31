class Classification < ActiveRecord::Base
  attr_accessible :classifiable, :classifiable_id, :classifiable_type,
                  :taxonomy, :taxonomy_id, :taxonomy_type

  belongs_to :classifiable, :polymorphic => true
  belongs_to :taxonomy,     :polymorphic => true
end
