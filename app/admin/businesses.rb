ActiveAdmin.register Business do

  form do |f|
    f.inputs do
      f.input :slug
      f.input :name
      f.input :tel
      f.input :fax
      f.input :email
      f.input :url
      f.input :logo, :as => :file
      f.input :description
      f.input :facebook_url
      f.input :twitter_url
      f.input :linkedin_url
    end
    f.buttons
  end

end
