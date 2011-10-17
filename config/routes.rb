Rails.application.routes.draw do
  # Add your extension routes here
  root :to => 'home#index'
  resources :destinations, :tours, :pages, :tour_orders
  match 'home(/:action)' => 'home'
  
  namespace :admin do
    match 'destinations/photos' => 'destinations#photos'
    match 'destinations/photos_reset' => 'destinations#photos_reset'
    resources :destinations
    resources :pages
    resources :shop_orders
    resources :tours do
      match 'destinations' => 'tours#destinations'
      resources :spots do
        collection do
          post :update_positions
        end
      end
    end
    match 'schedules/generate(/:op)' => 'schedules#generate'
    resources :schedules
    resources :hotels
    resources :locations
    resources :companies
    resources :employees
    resources :customers
    resources :vehicles
    resources :user_infos
    resources :gen_schedules, :only => :index
    
  end
  match ':controller/:id/:action', :controller => /admin\/[^\/]+/
end
