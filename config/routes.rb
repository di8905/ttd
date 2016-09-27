Rails.application.routes.draw do
  get 'welcome/index'
  
  # post 'update_position/:id', to: 'railway_stations#update_position', as: 'update_position'
  root 'welcome#index'
  resources :trains do
    resources :carriages, shallow: true
  end
  
  resources :railway_stations do
    patch :update_position, on: :member
    patch :set_departure, on: :member
    patch :set_arrival, on: :member
  end
  resources :routes
  resources :tickets
  
  resource :ticket_search, only: [:new, :show, :edit]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
