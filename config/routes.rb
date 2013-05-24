Kixo::Application.routes.draw do
  # I18n
  scope "(:locale)", :locale => /fr|en/ do
    devise_for :users, :controllers => {
        :registrations => "users/registrations",
        :sessions => "users/sessions"
    }

    devise_scope :user do
      get "/users/change_plan/:plan" => "users/registrations#change_plan", :as => :change_user_plan
      resources :cards
    end

    resources :professionals do
      collection do
        get "search"
      end
    end

    resources :conversations do
      resources :messages
    end

    resources :notifications

    resources :questions do
      resources :answers
    end

    resources :categories do
      resources :topics
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

    resources :pages, :only => [:show]

    resources :guides

    resources :comments

    namespace :data do
      resources :whats
      resources :wheres
      resources :localities
    end

    namespace :admin do
      resources :users
      resources :questions
      resources :pages
      resources :ads

      root :to => "dashboard#index"
    end
  end

  match "/:locale" => "pages#index"

  root :to => "pages#index"
end
