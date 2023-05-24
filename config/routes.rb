Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :foods, only: [:index, :new, :create] do
      resources :recipes, only: [:index, :show, :destroy]
    end
  end
end
