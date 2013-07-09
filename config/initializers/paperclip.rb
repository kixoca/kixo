Paperclip::Attachment.default_options.merge!(
    :storage => :s3,
    :bucket => ENV['AWS_BUCKET'],
    :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    :url => ':class/:attachment/:id/:style.:extension',
    :path => '/:class/:attachment/:id/:style.:extension',
    :default_url => '/:class/:attachment/defaults/:style.png'
)