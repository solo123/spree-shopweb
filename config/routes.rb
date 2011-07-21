Rails.application.routes.draw do
  # Add your extension routes here
  root :to => 'home#index'
  resources :destinations
  resources :tours
  resources :pages
  match 'home(/:action)' => 'home'
  
  
  namespace :admin do
    match 'destinations/photos' => 'destinations#photos'
    resources :destinations do
    	resources :photos do
        collection do
          post :update_positions
        end
        match 'cover' => 'photos#cover'
      end
    end
    resources :pages
    resources :photos
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
