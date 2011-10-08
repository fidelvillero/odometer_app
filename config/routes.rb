Odometer::Application.routes.draw do
  #devise_for :users, controllers: {registrations: "users/registrations"}

  #resources :profiles, only: [:show], controller: "users/profiles"

  #root to: "pages#index"
  
  
  devise_for :users, controllers: {registrations: "users/registrations"}
  
  resource :profile, only: [:show, :edit, :new], controller: "users/profiles"
  
  resources :stations do
    resources :services
    #singleton
    #resource :service, :only [:show, :destroy, :new]
  end
  
  #singleton OJO... 
  #resource :service, only: [:show, :destroy, :new], controller: "services"
  
  resources :locations
  
  #root :to => "users/profiles#index"
  root :to => "users/profiles#show"
end
