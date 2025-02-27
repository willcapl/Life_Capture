Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "pages#home"
  resources :sub_users, only: [:new, :edit, :update, :create, :destroy], except: [:show] do
    resources :questions, only: [:index, :show, :update, :destroy]
    resources :playlists, only: [:index, :new, :create] do
        resources :response_bookmarks, only: [:create]

    end
      member do
        patch 'update_avatar'
      end
  end
  resources :questions, only: [:destroy]

  delete '/playlists/:playlist_id/questions/:question_id/response_bookmarks', to: 'response_bookmarks#destroy', as: :delete_response_bookmark
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

  get '/sub_users/sub_user_id/film', to: 'sub_users#film', as: 'film'

  get '/sub_users/sub_user_id/book', to: 'sub_users#book', as: 'book'
end
