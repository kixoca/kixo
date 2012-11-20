ActiveAdmin.register Professional do
  filter :name
  filter :email
  filter :tel
  filter :locality
  filter :region
  filter :postal_code
  filter :country
  filter :locale
  filter :created_at
  filter :updated_at

  index do
    column :name
    column :email
    column :locality
    column :region
    column :topics do |professional|
      professional.topics_list
    end
    column :professions do |professional|
      professional.professions_list
    end
    default_actions
  end

  show do |professional|
    attributes_table do
      row :name
      row :email
      row :tel
      row :street_address_1
      row :street_address_2
      row :locality
      row :region
      row :postal_code
      row :country
      row :headshot do
        image_tag(professional.headshot.url)
      end
      row :topics do
        professional.topics.pluck("name").join(", ")
      end
      row :professions do
        professional.professions.pluck("name").join(", ")
      end
      row :locale
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :tel
      f.input :street_address_1
      f.input :street_address_2
      f.input :locality
      f.input :region
      f.input :postal_code
      f.input :country
      f.input :headshot
      f.input :topics
      f.input :professions
      f.input :locale
    end
    f.buttons
  end
end
