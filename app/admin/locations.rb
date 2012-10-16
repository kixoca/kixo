ActiveAdmin.register Location do

  index do
    column :business
    column :locality
    column :region
    column :postal_code
    column :country
    column :tel
    column :email
    default_actions
  end

end
