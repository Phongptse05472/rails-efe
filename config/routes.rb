Rails.application.routes.draw do
  root "courses#index"

  # match 'courses/update_enrollment_number' => 'courses#update_enrollment_number', via: :post

  devise_for :users,path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'sign_up'}

  resources :courses, only: [:index, :show] do
    resources :articles, only: [:index, :show]
    get '/courses/:id', to: 'article#index'
  end
  resources :articles , only: [:index, :show]


  namespace :admin do
    resources :users, except: :delete
    resources :courses, except: [:create, :delete]
    resources :articles , except: [:create, :delete]

  end
end
