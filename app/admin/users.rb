ActiveAdmin.register User do

  index do
    column :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column :email
    column :tel
    column "Businesses" do |user|
      (user.businesses.map{ |business|
        link_to(business.name, admin_business_path(business))
      }).join(', ').html_safe
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :tel
      f.input :businesses
      f.input :door_number
      f.input :house_number
      f.input :street_name
      f.input :locality
      f.input :region
      f.input :postal_code
      f.input :country
    end
    f.buttons
  end

end
