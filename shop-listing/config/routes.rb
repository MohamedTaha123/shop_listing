# frozen_string_literal: true

Rails.application.routes.draw do
  resources :shops do
    member do
      put 'like', to: 'shops#like_shop'
      put 'unlike', to: 'shops#unlike_shop'
    end
  end
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
