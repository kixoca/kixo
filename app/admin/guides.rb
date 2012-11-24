ActiveAdmin.register Guide do
  filter :locale
  filter :topic
  filter :title
  filter :content
  filter :created_at
  filter :updated_at

  index do
    column :title
    column :topic
    column :professional
    column :locale
  end

  show do
    attributes_table do
      row :title
      row :topic
      row :status
      row :professional
      row :excerpt
      row :content
      row :locale
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :topic
      f.input :status
      f.input :professional
      f.input :excerpt
      f.input :content
      f.input :locale
    end
    f.actions
  end
end
