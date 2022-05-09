Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :likes, only: %i[create]
      resources :comments, only: %i[create]
    end
  end
end
