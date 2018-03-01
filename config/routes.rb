Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :recipes do
    get 'search', on: :collection
  end
  resources :cuisines, only: [:new, :show, :create, :edit, :update]
  resources :recipe_types
end
