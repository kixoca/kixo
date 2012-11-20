ActiveAdmin.register Profession do
  filter :locale
  filter :category
  filter :name
  filter :slug
  filter :created_at
  filter :updated_at

  index do
    column :name
    column :slug
    column :locale
    column :category
    default_actions
  end

  show do
    attributes_table do
      row :category
      row :name
      row :slug
      row :description
      row :locale
      row :created_at
      row :updated_at
    end
  end
end
