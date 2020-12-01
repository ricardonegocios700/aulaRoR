Rails.application.routes.draw do
  resources :contacts
  resources :contact_types
  resources :addresses
  resources :address_types
  resources :shifts
  resources :people
  devise_for :users
  resources :welcome
  
  root to:   'welcome#index'
  get        'welcome/index'
  
  # para não criar destroy
  # resources  :person_types, [only: index, show, update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
