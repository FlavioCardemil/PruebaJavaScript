Rails.application.routes.draw do
  resources :types
  resources :categories
  resources :bookmarks
  root 'types#index'

  get "api/category/:id", to: "categories#api"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
