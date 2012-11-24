ActiveAdmin.register Question do
  filter :locale
  filter :title
  filter :details
  filter :status
  filter :created_at
  filter :updated_at

  index do
    column :title
    column :status
    column :user
    default_actions
  end

  show do |question|
    attributes_table do
      row :title
      row :details
      row :status
      row :questions do
        question.topics_list
      end
      row :locale
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :status
      f.input :visibility
      f.input :locale
      f.input :title
      f.input :details
      f.input :topics
    end
    f.actions
  end
end
