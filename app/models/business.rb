class Business < ActiveRecord::Base

  attr_accessible :slug, :name, :tel, :fax, :email, :url, :logo, :description,
                  :facebook_url, :twitter_url, :linkedin_url,
                  :representant_id, :category_ids

  # a business can have many locations (physical addresses)
  has_many :locations, :dependent => :destroy

  # a business is linked to one or many categories
  has_and_belongs_to_many :categories

  # a business is linked to a representant
  belongs_to :representant

  # a business is linked with a user (owner)
  belongs_to :user

  # accept nested setting of representant and categories
  accepts_nested_attributes_for :representant, :categories

  # business name is a required field
  validates :name, :presence => true

  # use paperclip to attach a logo
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  # rewrite urls with slug inserted
  def to_param
    "#{id}-#{slug}"
  end

  # auto-generate slug
  before_save :generate_slug

  private

  # generates a slug from the name using 'to_slug' extension
  # unless a slug is specified
  def generate_slug
    self.slug = self.name.to_slug if slug.empty?
  end

end
