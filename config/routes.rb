Kixo::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :users
  devise_for :professionals
  devise_for :representants
  devise_for :admin_users, ActiveAdmin::Devise.config

  # I18n
  scope "(:locale)", :locale => /en|fr/ do
    resources :professionals
    resources :questions
    resources :answers
    resources :guides
    resources :categories
    resources :topics
    resources :professions
    resources :reviews
  end

  root :to => "page#index"

end
