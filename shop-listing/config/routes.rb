# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shops, except: %i[update destroy] do
    member do
      put 'like', to: 'shops#like_shop'
      put 'unlike', to: 'shops#unlike_shop'
    end
  end
  devise_for :users
  root 'shops#index'
  get 'preferred', to: 'shops#preferred_shops'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
