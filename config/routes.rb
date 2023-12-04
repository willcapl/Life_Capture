Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  resources :sub_users, only: [:new, :edit, :update, :create, :destroy], except: [:show] do
    resources :questions, only: [:index, :show, :update]
    resources :playlists, only: [:index, :new, :create]
      member do
        patch 'update_avatar'
      end
  end
  resources :questions, only: [:destroy]
  get '/sub_users/:id', to: 'sub_users#show', as: 'sub_user_show'
  get 'dashboard', to: 'pages#dashboard'
  get 'loading', to: 'pages#loading', as: 'loading'

    # ... other routes ...

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'faq', to: 'pages#faq'
  get 'about', to: 'pages#about'

  get 'sub_user_selection', to: 'pages#sub_user_selection'

  get 'others_new', to: 'sub_users#other_new'

  # get '/sub_users/:id/playlists', to: 'sub_users#playlists', as: 'sub_user_playlists'

  get '/sub_users/:id/stories', to: 'sub_users#stories', as: 'sub_user_stories'

  get 'film', to: 'sub_users#film'

  get 'book', to: 'sub_users#book'
end
