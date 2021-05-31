Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root :to => "users#landing_page"
resources :users, only: [:create, :new]
delete '/logout' => 'users#logout'
end
