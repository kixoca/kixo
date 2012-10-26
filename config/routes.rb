Kixo::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  devise_for :professionals
  devise_for :representants
  devise_for :admin_users, ActiveAdmin::Devise.config

end
