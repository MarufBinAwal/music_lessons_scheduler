Rails.application.routes.draw do

  get '/instructors/all', to: 'instructors#full_index'
  get '/availabilities/:id/all', to: 'availabilities#full_show'
  get '/availabilities/:id/deactivate', to: 'availabilities#deactivate'
  get '/lessons/all', to: 'lessons#full_index'
  resources :students
  resources :lessons, only: [:index,:edit,:update,:new,:create,:destroy]
  resources :instructors do
    get '/availabilities', to: 'availabilities#index'
    get '/availabilities/all', to: 'availabilities#full_index'
  end
  resources :availabilities, only: [:show,:edit,:update,:new,:create, :destroy]
  
  get '/', to: "admin#login_form"
  resources :admins, except: [:show]

  post '/authenticate', to: "application#authenticate"

  get '/logout', to: "application#log_out"
  
  
end
