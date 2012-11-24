ActiveAdmin.register Category do
  filter :locale
  filter :name
  filter :created_at
  filter :updated_at

  index do
    column :name
    column :description
    column :locale
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :locale
      row :created_at
      row :updated_at
    end
  end

end
