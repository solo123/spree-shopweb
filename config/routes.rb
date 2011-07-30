Rails.application.routes.draw do
  # Add your extension routes here
  root :to => 'home#index'
  resources :destinations
  resources :tours
  resources :pages
  match 'home(/:action)' => 'home'
  
  
  namespace :admin do
    match 'destinations/photos' => 'destinations#photos'
    match 'destinations/photos_reset' => 'destinations#photos_reset'
    resources :destinations
    resources :pages
    resources :tours do
      match 'destinations' => 'tours#destinations'
      resources :spots do
        collection do
          post :update_positions
        end
      end
    end
    resources :schedules
    resources :hotels
    resources :locations
    resources :companies
    resources :employees
    resources :vehicles
    resources :user_infos
    
  end
end
