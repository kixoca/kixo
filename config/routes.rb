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
      resources :topics do
        resources :guides
      end
      resources :professions
    end

    resources :eager_beavers

  end

  match "/:locale" => "pages#index"

  root :to => "eager_beavers#new"

end
