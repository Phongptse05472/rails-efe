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

  #common routes
  get 'home', to: 'courses#index'
  get 'courses', to: 'courses#show'
  get 'mycourses', to:'courses#mycourse'
  get 'archived-courses', to:'courses#archived_courses'
  get 'favor-articles', to:'courses#favor_articles'
  get 'topic/:id' ,to: 'topics#show', :as => :show_topic
  get 'topic/:id/course' ,to: 'courses#show' , :as => :show_course_topic
  get 'search' ,to: 'courses#search'



  resources :courses, only: [:index, :show] do
    resources :articles, only: [:index, :show]

  end
  resources :articles , only: [:index, :show]do
    resources :articles, only: [:index, :show]

  end

  #mentor routes
  namespace :mentor do
    resources :courses
  end

  #admin routes
  namespace :admin do
    resources :users, except: :delete
    resources :courses, except: [:create, :delete]
    resources :articles , except: [:create, :delete]

  end
end
