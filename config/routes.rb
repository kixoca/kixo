Kixo::Application.routes.draw do
  get "questions/index"

  get "pages/index"

  get "users/index"

  get "dashboard/index"

  # I18n
  scope "(:locale)", :locale => /fr|en/ do
    devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}

    resources :professionals do
      collection do
        get "search"
      end

      resources :reviews
    end

    resources :conversations do
      resources :messages
    end

    resources :notifications

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

    resources :questions

    resources :answers

    resources :guides

    resources :comments

    resources :whats
    resources :wheres

    resources :cards

    namespace :admin do
      resources :users
      resources :questions
      resources :pages

      root :to => "dashboard#index"
    end
  end

  match "/:locale" => "pages#index"

  root :to => "pages#index"
end
