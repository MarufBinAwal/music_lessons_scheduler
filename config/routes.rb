Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :students
  resources :lessons
  resources :instructors do
    get '/availabilities', to: 'availabilities#index'
  end
  resources :availabilities
  
end
