ActiveAdmin.register Representant do

  index do
    column :name do |representant|
      link_to representant.name, admin_representant_path(representant)
    end
    column :email
    column :tel
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :tel
    end
    f.buttons
  end

end
