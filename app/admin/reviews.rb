ActiveAdmin.register Review do
  filter :locale
  filter :rating
  filter :created_at
  filter :updated_at

  index do
    column :professional
    column :user
    column :rating
    column :locale
    default_actions
  end

  show do
    attributes_table do
      row :comment
      row :rating
      row :professional
      row :user
      row :locale
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :comment
      f.input :rating
      f.input :professional
      f.input :user
      f.input :locale
    end
    f.actions
  end
end
