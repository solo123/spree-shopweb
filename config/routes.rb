Rails.application.routes.draw do
  # Add your extension routes here
  resources :destinations
  resources :tours
  resources :pages
  
  namespace :admin do
    resources :destinations
  end
end
