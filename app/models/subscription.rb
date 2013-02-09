class Subscription < ActiveRecord::Base
  attr_accessible :user, :user_id, :plan, :plan_id

  belongs_to :plan
  belongs_to :user

  validates_existence_of :plan
  validates_existence_of :user
end
