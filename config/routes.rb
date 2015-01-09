Rails.application.routes.draw do
  root 'pages#home'

  resources :users
  resources :inner_circles

  get    '/bench',  to: "pages#bench"
  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
