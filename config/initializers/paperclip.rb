#Paperclip.options[:command_path] = "/usr/local/bin/"

Paperclip::Attachment.default_options.merge!(
    :storage => :s3,
    :bucket => ENV['AWS_BUCKET'],
    :s3_credentials => {
        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    },
    :s3_host_alias => ENV['ASSET_HOST'],
    :url => ':class/:attachment/:id/:style.:extension',
    :path => '/:class/:attachment/:id/:style.:extension',
    :default_url => '/assets/defaults/:class/:attachment/:style.png'
)
