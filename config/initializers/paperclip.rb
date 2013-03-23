config.paperclip_defaults = {
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml"
}