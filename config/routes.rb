# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :projects do
    collection do
      get :inactive
    end
    member do
      delete :restore
    end
  end
  resources :assigns do
    collection do
      get :inactive
    end
    member do
      delete :restore
    end
  end
  resources :employees do
    collection do
      get :inactive
    end
    member do
      delete :restore
    end
  end
  resources :profiles
  resources :technologies
  resources :crediential_types
  resources :credientials
end
