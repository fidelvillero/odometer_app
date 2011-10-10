Odometer::Application.routes.draw do
  match 'stations/show/:id' => 'stations#show'
  devise_for :users, controllers: {registrations: "users/registrations"}
  resources :stations do
    resources :services
  end
  resource :profile, only: [:show, :edit, :new], controller: "users/profiles"
  #singleton OJO... 
  #resource :service, only: [:show, :destroy, :new], controller: "services"
  resources :locations
  #root :to => "users/stations#index"
  root :to => "users/profiles#show"
end
