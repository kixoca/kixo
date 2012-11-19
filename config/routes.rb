Kixo::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  # I18n
  scope "(:locale)", :locale => /en|fr/ do

    devise_for :users
    devise_for :professionals
    devise_for :representants

    resources :professionals do
      resources :reviews
    end

    resources :questions do
      resources :answers
    end

    resources :categories do
      resources :topics
      resources :professions
      resources :guides
    end

  end

  match '/:locale' => 'pages#index'

  root :to => "pages#index"

end
