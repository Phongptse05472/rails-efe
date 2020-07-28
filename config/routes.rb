Rails.application.routes.draw do
  # root "pages#rootpage"


  Rails.application.routes.draw do
    devise_for :users, controllers: {
        sessions: 'users/sessions'
    }
  end

  resources :topics, only: [:index, :show], param: :slug

  #common routes
  get 'home', to: 'courses#index'
  get 'mycourses', to: 'courses#mycourse'
  get 'archived-courses', to: 'courses#archived_courses'
  get 'favor-articles', to: 'articles#favor_articles'
  get 'search', to: 'courses#search'
  get 'profile', to: 'customers#show'
  get 'user-home', to: 'courses#customer_home'
  get 'search' ,to: 'courses#search', :as => :search_courses

  put 'courses/:slug', to: 'courses#update_archive', :as => :update_archived

  post 'courses/:slug', to: 'courses#add_course_to_archived', :as => :add_to_archived

  post 'courses/:slug', to: 'courses#enroll_courses', :as => :enroll_to_course

  put 'articles/:id', to: 'articles#update_favor' , :as => :update_favor

    resources :courses, only: [:index, :show, :update], param: :slug do
      resources :articles, only: [:index, :show]
    end



  #mentor routes
  namespace :mentor do
    resources :courses
  end

  #admin routes
  namespace :admin do
    resources :users, except: :destroy
    resources :courses
    resources :articles, except: [:create, :destroy]
  end
end
