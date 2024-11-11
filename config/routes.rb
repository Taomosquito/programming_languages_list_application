Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'resources#index'
  resources :resources, only: [:index, :new, :create, :destroy, :show, :edit, :update]
  # Defines the root path route ("/")
  # root "articles#index"
end
