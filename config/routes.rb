Rails.application.routes.draw do
  resources :usrs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/usrs/:id/timer', to: 'usrs#timer', as: 'usr_timer'
  get '/login', to: 'login#login', as: 'login'
  get '/create_usr', to: 'login#create_account', as: 'create_usr'
end
