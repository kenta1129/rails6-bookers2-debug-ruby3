Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "homes#top"
  get "homes/about"=>"homes#about"
 devise_for :users



  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
  resources :post_comments, only: [:create, :destroy]
  resource :favorite, only: [:create, :destroy]

end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index,:show,:edit,:update,:create]

end
