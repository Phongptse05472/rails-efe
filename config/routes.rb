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
  get 'archived-courses', to: 'customers_courses#archived_courses'
  get 'search', to: 'courses#search'
  get 'profile', to: 'customers#show'
  get 'user-home', to: 'customers_courses#customer_home', :as  => :user_home
  get 'search' ,to: 'courses#search', :as => :search_courses

  post 'courses/:id', to: 'customers_courses#update', :as => :update_archived

  post 'archive_courses/:slug', to: 'customers_courses#add_course_to_archived', :as => :add_to_archived

  post 'enroll_courses/:slug', to: 'customers_courses#enroll_courses', :as => :enroll_to_course

  put 'articles/:id', to: 'customers_articles#update' , :as => :update_favor

  post 'favor_articles/:id', to: 'customers_articles#add_to_favor' , :as => :add_to_favor

  post 'courses/:slug/articles/:id', to: 'customers_courses#click_on_article' , :as => 'click_on_article'

  resources :customers_courses, param: :slug do
  end

  resources :customers_articles do
  end

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
