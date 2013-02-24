class Message < ActiveRecord::Base
  attr_accessible :from, :from_id, :to, :to_id, :to_name, :parent, :parent_id, :content, :read

  attr_accessor :to_name

  belongs_to :from, :class_name => "User"
  belongs_to :to,   :class_name => "User"

  belongs_to :parent, :class_name => "Message"
  has_many :children, :class_name => "Message", :foreign_key => :parent_id

  # set default values on init
  after_initialize :default_values

  validates_existence_of :from
  validates_existence_of :to

  def correspondent(ref_user)
    self.from_id == ref_user.id ? self.to : self.from
  end

  def latest_child
    unless self.children.blank?
      self.children.last
    else
      self
    end
  end

  private

  def default_values
    self.read = false if self.read.blank?
  end
end
