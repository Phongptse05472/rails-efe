Rails.application.routes.draw do

  devise_for :users, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'secret',
      confirmation: 'verification',
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'sign_up'}

  namespace :admin do
    as :user do
      get "sign_in" => "devise/sessions#new"
      delete 'sign_out', to: '/devise/sessions#destroy'
    end
    resources :users, except: :delete
    resources :courses, except: [:create, :delete]
    resources :articles , except: [:create, :delete]
  end
end
