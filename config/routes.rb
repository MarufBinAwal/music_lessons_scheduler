Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/instructors/all', to: 'instructors#full_index'
  get '/availabilities/:id/all', to: 'availabilities#full_show'
  get '/availabilities/:id/deactivate', to: 'availabilities#deactivate'
  resources :students
  resources :lessons
  resources :instructors do
    get '/availabilities', to: 'availabilities#index'
    get '/availabilities/all', to: 'availabilities#full_index'
  end
  resources :availabilities, only: [:show,:edit,:update,:new,:create, :destroy]
  
end
