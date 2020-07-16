Rails.application.routes.draw do
  # root "pages#rootpage"
  # topics :courses
  # topics :articles
  # match 'courses/update_enrollment_number' => 'courses#update_enrollment_number', via: :post

  devise_for :users,path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'sign_up'}

  get 'home', to: 'courses#index'
  get 'topic', to: 'topics#show'

  get 'courses', to: 'customers#index'
  get 'mycourses', to: 'customers#mycourse'
  get 'archives', to: 'customers#archive'
  get 'favors', to: 'customers#favor'

  resources :courses, only: [:index, :show] do
    resources :articles, only: [:index, :show]
    resources :topics, only: [:index, :show]

  end
  resources :articles , only: [:index, :show]do
    resources :articles, only: [:index, :show]

  end


  namespace :admin do
    resources :users, except: :delete
    resources :courses, except: [:create, :delete]
    resources :articles , except: [:create, :delete]

  end
end
