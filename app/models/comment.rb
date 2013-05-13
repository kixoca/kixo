class Comment < ActiveRecord::Base
  acts_as_paranoid

  attr_accessible :comment, :commentable, :commentable_id, :commentable_type, :author, :author_id, :deleted_at

  belongs_to :commentable, :polymorphic => true,  :counter_cache => true
  belongs_to :author,      :class_name => "User", :counter_cache => true

  validates :comment,     :presence => true
  validates :commentable, :presence => true
  validates :author,      :presence => true
end
