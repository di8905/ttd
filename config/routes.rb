Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  # post 'update_position/:id', to: 'railway_stations#update_position', as: 'update_position'
  root 'welcome#index'
    
  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :routes
    resources :railway_stations do
      patch :update_position, on: :member
      patch :set_departure, on: :member
      patch :set_arrival, on: :member
    end  
    resources :tickets
      
  end
  
  resources :tickets

  resource :ticket_search, only: [:new, :show, :edit]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
