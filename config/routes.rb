Rails.application.routes.draw do
  
  resources :quizzes, :questions, :answers

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root :to => "users#landing_page"
resources :users, only: [:create, :new]
delete '/logout' => 'users#logout'
get '/take-quiz/:id' => 'user_contests#take_quiz'
get '/dashboard' => 'user_contests#dashboard'
post '/submit-quiz/:id' => 'user_contests#submit_quiz'



end
