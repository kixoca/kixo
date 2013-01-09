Kixo::Application.routes.draw do

  # I18n
  scope "(:locale)", :locale => /en|fr/ do

    ActiveAdmin.routes(self)

    devise_for :admin_users, ActiveAdmin::Devise.config
    devise_for :users

    resources :users do
      resources :reviews
    end

    resources :questions do
      resources :answers
    end

    resources :categories do
      resources :topics do
        resources :guides
      end
      resources :professions
    end

    resources :countries do
      resources :regions do
        resources :localities
      end
    end

    resources :localities do
      resources :topics
      resources :professions
    end

  end

  match "/:locale" => "pages#index"

  root :to => "pages#index"

end
