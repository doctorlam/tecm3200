Rails.application.routes.draw do
  resources :tutorials
  resources :presentations
  resources :grades
  resources :submissions
  resources :assignments
  resources :abouts
  resources :projects
  resources :courses
  resources :posts do 
    resources :responses
  end

  get 'pages/gradebook'
  get 'pages/accounts'
  get 'usergrades' => "submissions#usergrades"
 
  devise_for :users
   match 'users/:id' => 'users#index', via: :get
# or 
get 'users/:id' => 'users#index'
# or
resources :users, only: [:index]

root :to => 'abouts#index'  
resources :lessons
  get 'pages/policies'

end
