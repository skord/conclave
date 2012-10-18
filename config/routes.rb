require 'api_constraints'

Conclave::Application.routes.draw do
  devise_for :users, controllers: {
    sessions:           "sessions",
    omniauth_callbacks: "omniauth_callbacks"
  }

  ActiveAdmin.routes(self)

  resources :watches, :only => [:index]

  resources :users, :only => [:show, :index, :update] do
    post :ban, on: :member
  end

  resources :forums, :only => [:show, :index] do
    resources :conversations, :only => [:new, :create, :index]
  end

  resources :conversations, :except => [:new, :create, :index] do
    resources :watches, :only => [:create] do
      delete :destroy, :on => :collection
    end
    resources :comments, :except => [:show] do
      member do
        post 'redact'
        post 'unredact'
      end
    end
  end

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version:1, default: :true) do
      resources :forums, only: [:index, :show] do
        resources :conversations, only: [:index]
      end
      resources :conversations, only: [:show]
    end
  end

  match "/my_conversations", to: "users#my_conversations", as: "my_conversations"

  devise_scope :user do
    match "/we_need_your_email", to: "omniauth_callbacks#email_pease", as: "email_pease"
  end

  root :to => "forums#index"
end
