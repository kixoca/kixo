class Classification < ActiveRecord::Base
  attr_accessible :classifiable, :classifiable_id, :classifiable_type,
                  :taxonomy, :taxonomy_id, :taxonomy_type

  belongs_to :classifiable, :polymorphic => true
  belongs_to :taxonomy,     :polymorphic => true

  before_create  :increment_counter
  before_destroy :decrement_counter

  private

  # increments the right classifiable counter for the right taxonomy
  def increment_counter
    self.taxonomy_type.constantize.increment_counter("#{self.classifiable_type.downcase.pluralize}_count", self.taxonomy_id)
  end

  # decrements the right classifiable counter for the right taxonomy
  def decrement_counter
    self.taxonomy_type.constantize.decrement_counter("#{self.classifiable_type.downcase.pluralize}_count", self.taxonomy_id)
  end
end
