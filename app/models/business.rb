class Business < ActiveRecord::Base

  attr_accessible :slug, :name, :tel, :fax, :email, :url, :description,
                  :facebook_url, :twitter_url, :linkedin_url, :representant_id

  # a business can have many locations (physical addresses)
  has_many :locations, :dependent => :destroy

  validates :slug, :presence => true, :uniqueness => true
  validates :name, :presence => true

  # after the business has been written to the database, deal with
  # writing any logo image data to the filesystem
  after_save :store_logo

  private

  # def store_logo
  #   if @file_data
  #     # make the logo store directory if it doesn't exist already
  #     FileUtils.mkdir_p LOGO_STORE
  #     # write out the image data to the file
  #     File.open(logo_filename, 'wb') do |f|
  #       f.write(@file_data.read)
  #     end
  #     # ensure file saved only when it newly arrives at model being saved
  #     @file_data = nil
  #   end
  # end

  # when logo data is assigned via the upload, store the file data
  # for later and assign the file extension, e.g., ".jpg"
  # def logo=(file_data)
  #   unless file_data.blank?
  #     # store the uploaded data into a private instance variable
  #     @file_data = file_data
  #     # figure out the last part of the filename and use this as
  #     # the file extension, e.g., from "logo.jpg" will return "jpg"
  #     self.extension = file_data.original_filename.split('.').last.downcase
  #   end
  # end

  # File.join is a cross-platform way of joining directories;
  # we could have written "#{Rails.root}/public/logo_store"
  # LOGO_STORE = File.join Rails.root, 'public', 'logo_store'

  # where to write the image file to
  # def logo_filename
  #   File.join LOGO_STORE, "#{slug}-#{id}.#{extension}"
  # end

  # return a path we can use in HTML for the image
  # def logo_path
  #   "/logo_store/#{slug}-#{id}.#{extension}"
  # end

  # if a logo file exists, then we have a logo
  # def has_logo?
  #   File.exists? logo_filename
  # end

end
