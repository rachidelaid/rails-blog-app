Rails.application.routes.draw do
  root "users#index"

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create] do
      resources :likes, only: %i[create]
      resources :comments, only: %i[create]
    end
  end
end
