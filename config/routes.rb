Rails.application.routes.draw do
  root "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "users#posts"
  get "/users/:id/posts/:id", to: "users#post"
end
