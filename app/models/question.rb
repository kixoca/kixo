class Question < ActiveRecord::Base

  attr_accessible :title, :details, :status, :topic_ids, :user_id, :locale_id

  # a questions belongs to a user
  belongs_to :user

  # a questions is related to one or many topics
  has_and_belongs_to_many :topics

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title,  :presence => true
  validates :status, :presence => true
  validates_presence_of :topics
  validates_existence_of :user
  validates_existence_of :locale

  private

  def default_values
    self.status = 1 if (self.status.nil? or self.status == 0)
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
