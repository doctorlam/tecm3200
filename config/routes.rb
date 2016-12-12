Rails.application.routes.draw do
  resources :presentations
  resources :grades
  resources :assignments do
  resources :submissions, only: [:new, :create, :edit, :show]
end
  resources :abouts
  resources :projects
  resources :courses
  resources :posts do 
    resources :responses
  end

  get 'pages/gradebook'
  get 'pages/accounts'
    get 'pages/usergrades'
 get 'instructor_gradebook' => "submissions#instructor_gradebook"
  get 'student_history' => "submissions#student_history"
 
  devise_for :users
   match 'users/:id' => 'users#index', via: :get
# or 
get 'users/:id' => 'users#index'
# or
resources :users, only: [:index]

root :to => 'lessons#index'  
resources :lessons
  get 'pages/policies'

end
