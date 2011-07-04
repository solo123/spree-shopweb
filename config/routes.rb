Rails.application.routes.draw do
  # Add your extension routes here
  root :to => 'home#index'
  resources :destinations
  resources :tours
  resources :pages
  match 'home(/:action)' => 'home'
  
  namespace :admin do
    resources :destinations
    resources :pages
    resources :photos
    resources :tours
    resources :schedules
    resources :hotels
    
    resources :companies
    resources :employees
    resources :vehicles
    resources :user_infos
  end
end
