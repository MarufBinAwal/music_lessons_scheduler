Rails.application.routes.draw do
  get 'sessions/new'

 
  resources :students
  resources :lessons
  resources :instructors do
    get '/availabilities', to: 'availabilities#index'
  end
  resources :availabilities, only: [:show,:edit,:update,:new,:create, :destroy]
  
  get '/', to: "instructors#login_form"

  post '/authenticate', to: "application#authenticate"

  get '/logout', to: "application#log_out"
  
  
end
