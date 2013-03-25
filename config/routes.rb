Kixo::Application.routes.draw do

  constraints(:host => /kixo.ca/) do
    root :to => redirect("http://www.kixo.ca")
    match '/*path', :to => redirect {|params| "http://www.kixo.ca/#{params[:path]}"}
  end

  # I18n
  scope "(:locale)", :locale => /fr|en/ do

    ActiveAdmin.routes(self)

    devise_for :admin_users, ActiveAdmin::Devise.config
    devise_for :users, :controllers => {:registrations => "registrations"}

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

    resources :whats
    resources :wheres

    resources :cards

  end

  match "/:locale" => "pages#index"

  root :to => "pages#index"

end
