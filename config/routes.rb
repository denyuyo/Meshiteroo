Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  
  resources :post_images, only: [:new, :create, :index, :show]
  
  get "homes/about" => "homes#about", as:'about'
  get 'post_image/:id' => 'post_images#show'
end
