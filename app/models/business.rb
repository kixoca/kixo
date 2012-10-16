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

  accepts_nested_attributes_for :representant, :categories

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
