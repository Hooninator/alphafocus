Rails.application.routes.draw do
  resources :usrs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/usrs/:id/timer', to: 'usrs#timer', as: 'usr_timer'
end
