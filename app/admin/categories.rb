ActiveAdmin.register Category do

  index do
    column :name do |category|
      link_to category.name, admin_category_path(category)
    end
    column :slug
    column :description
    default_actions
  end

end
