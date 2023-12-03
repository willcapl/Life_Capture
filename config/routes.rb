Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  resources :sub_users, only: [:new, :edit, :update, :create, :destroy], except: [:show] do
    resources :questions, only: [:index, :show, :update]
  end
  resources :questions, only: [:destroy]
  get '/sub_users/:id', to: 'sub_users#show', as: 'sub_user_show'
  get 'dashboard', to: 'pages#dashboard'
  get 'loading', to: 'pages#loading', as: 'loading'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'FAQ', to: 'pages#faq'

  get 'sub_user_selection', to: 'pages#sub_user_selection'

  get 'others_new', to: 'sub_users#other_new'

  get 'playlists', to: 'sub_users#playlists'

  get 'stories', to: 'sub_users#stories'

  get 'film', to: 'sub_users#film'

  get 'book', to: 'sub_useers#book'
end
