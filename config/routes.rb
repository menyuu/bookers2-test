Rails.application.routes.draw do
  
  resources :books, only: [:index, :show, :new, :create, :edit]
  
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update]
  
  root to: 'homes#top'
  get 'about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end