ActiveAdmin.register Business do

  index do
    column :name do |business|
      link_to business.name, admin_business_path(business)
    end
    column :tel
    column :email
    column "Categories" do |business|
      (business.categories.map{ |category|
        link_to(category.name, admin_category_path(category))
      }).join(', ').html_safe
    end
    column "Locations" do |business|
      (business.locations.map{ |location|
        link_to(location.locality, admin_location_path(location))
      }).join(', ').html_safe
    end
    column :representant
    default_actions
  end

  show do
    attributes_table do
      row :slug
      row :name
      row :tel
      row :fax
      row :email
      row :url
      row :logo do
        link_to image_tag(business.logo.url(:thumb)), business.logo.url
      end
      row :description
      row :facebook_url
      row :twitter_url
      row :linkedin_url
      row "Categories" do
        (business.categories.map { |category| category.name }).join(', ')
      end
      row "Locations" do
        (business.locations.map { |location|
          location.inline_address + "&nbsp;&nbsp;" +
          link_to(I18n.t('active_admin.view'), admin_location_path(location), :class => "member_link view_link")
        }).join('<br />').html_safe
      end
      row :representant
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :slug
      f.input :tel
      f.input :fax
      f.input :email
      f.input :url
      f.input :logo, :as => :file
      f.input :description
      f.input :facebook_url
      f.input :twitter_url
      f.input :linkedin_url
      f.input :categories
      f.input :user, :label => "Owner"
      f.input :representant
    end
    f.buttons
  end

end
