ActiveAdmin.register Representant do
  filter :locale
  filter :name
  filter :email
  filter :tel
  filter :locality
  filter :region
  filter :country

  index do
    column :name
    column :email
    column :locality
    column :region
    column :country
    column :professionals do |representant|
      representant.professionals.count
    end
    default_actions
  end

  show do |representant|
    attributes_table do
      row :name
      row :email
      row :tel
      row :headshot do
        image_tag(representant.headshot.url)
      end
      row :street_address_1
      row :street_address_2
      row :locality
      row :region
      row :postal_code
      row :country
      row :locale
      row :sign_in_count
      row :professionals do
        representant.professionals.pluck("name").join(", ")
      end
      row :created_at
      row :updated_at
    end

    representant.professionals.pluck("name").join(", ")
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :tel
      f.input :headshot
      f.input :street_address_1
      f.input :street_address_2
      f.input :locality
      f.input :region
      f.input :postal_code
      f.input :country
      f.input :locale
    end
    f.actions
  end
end
