Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'splash_screen#index'
  get '/splash_screen', to: 'splash_screen#index', as: 'splash_screen'
  resources :groups, only: [:index, :show, :new, :create] do
    resources :founds_drainers, only: [:index, :new, :create]
  end
end
