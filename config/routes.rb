Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get '/top' => 'homes#top'
  get "homes/about"=>"homes#about"
 devise_for :users



  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update,:create,:new]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
