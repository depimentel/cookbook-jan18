Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes
  resources :cuisines
  resources :recipe_types, only: [:new, :create, :show]
end
