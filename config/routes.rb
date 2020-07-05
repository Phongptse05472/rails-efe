Rails.application.routes.draw do

  # mount ActionCable.server => '/cable'

  # resources :articles
  # resources :customers
  # devise_for :users
  # resources :courses

  mount ActionCable.server => '/cable'

  # localized do
    devise_for :users, only: [:sessions]

    namespace :api, :defaults => { :format => 'json' } do
      resources :courses, only: [:index, :show]

      # namespace :admin do
      #   as :user do
      #     delete 'sign_out', to: '/devise/sessions#destroy'
      #   end
      #   resources :dashboard, only: :index
      #   resources :users, except: :show
      #   resources :musicians, except: :show
      # end
    end

    # get '/admin', to: 'admin#index'
    # match "/admin/*path", to: "admin#index", format: false, via: :get

    root :to => "application#index"
    match "*path", to: "application#index", format: false, via: :get
  # end

end



  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'sign_up' }

    #devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

