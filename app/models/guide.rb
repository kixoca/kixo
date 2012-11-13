class Guide < ActiveRecord::Base
  include CommonScopes

  attr_accessible :title, :excerpt, :status, :content, :topic_id, :professional_id, :locale_id

  # a guide belongs to its author, a professional
  belongs_to :professional

  # a guide is associated with a topic
  belongs_to :topic

  # I18n
  belongs_to :locale

  # track versions with paper trail
  has_paper_trail

  # set default values on init
  after_initialize :default_values

  # validation
  validates :title,   :presence => true
  validates :slug,    :presence => true
  validates :excerpt, :presence => true
  validates :status,  :presence => true
  validates :content, :presence => true
  validates_existence_of :topic
  validates_existence_of :professional
  validates_existence_of :locale

  private

  def default_values
    self.slug = self.name.parameterize if self.slug.blank?
    self.locale_id = Locale.find_by_code(I18n.locale).id if (self.locale_id.nil? or self.locale_id == 0)
  end

end
