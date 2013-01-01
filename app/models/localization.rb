class Localization < ActiveRecord::Base
  attr_accessible :localizable, :localizable_id, :localizable_type, :locale, :locale_id

  belongs_to :localizable, :polymorphic => true
  belongs_to :locale
end
