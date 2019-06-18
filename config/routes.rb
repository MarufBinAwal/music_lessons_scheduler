Rails.application.routes.draw do
  get 'sessions/new'

 
  resources :students
  resources :lessons
  resources :instructors
  resources :availabilities

  get '/', to: "instructors#login_form"

  post 'instructors/authenticate', to: "instructors#authenticate"

  get '/logout', to: "instructors#log_out"
  
end
