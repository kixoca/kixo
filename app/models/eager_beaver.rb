class EagerBeaver < ActiveRecord::Base
  attr_accessible :email

  validates :email, :presence => true
end
