class Comment < ActiveRecord::Base
  attr_accessible :comment, :commentable, :commentable_id, :commentable_type, :author, :author_id

  belongs_to :commentable, :polymorphic => true,  :counter_cache => true
  belongs_to :author,      :class_name => "User", :counter_cache => true

  validates :comment,     :presence => {:message => I18n.t("comments.fields.comment.validation.presence")}
  validates :commentable, :presence => {:message => I18n.t("comments.fields.commentable.validation.presence")}
  validates :author,      :presence => {:message => I18n.t("comments.fields.author.validation.presence")}
end
