Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :sub_users, only: [:new, :edit, :update, :create, :destroy], except: [:show] do
    resources :questions, only: [:index, :show, :update]
  end
  get '/sub_users/:id', to: 'sub_users#show', as: 'sub_user_show'
  get 'dashboard', to: 'pages#dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'FAQ', to: 'pages#faq'
end
