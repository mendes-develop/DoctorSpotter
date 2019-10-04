Rails.application.routes.draw do

  get "/login", to: 'sessions#login', as: "login"
  post '/login', to:'sessions#verification', as: "verified"
  get '/logout', to: 'sessions#logout', as: 'logout'

# search path to
  get '/search', to: 'doctors#new'
  post '/doctors', to: 'doctors#index'



  resources :doctors, only: [:show] do
    # get '/appointments/new', to: 'appointments#new', as: "new_doctor_appointment_path"
    resources :appointments, only: [:new]
  end

  resources :appointments, except: [:new]
  resources :specialties
  resources :insurances
  resources :patients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
