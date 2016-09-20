Rails.application.routes.draw do
  get 'welcome/index'

  post 'update_position/:id', to: 'railway_stations#update_position', as: 'update_position'
  root 'welcome#index'
  resources :trains
  resources :railway_stations
  resources :routes
  resources :wagons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
