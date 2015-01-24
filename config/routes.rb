Rails.application.routes.draw do
  root 'pages#home'

  resources :users, param: :slug do 
    resources :inner_circles, param: :name
  end

  get    '/bench',  to: "pages#bench"
  get    '/login',  to: "sessions#new"
  post   '/login',  to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
end
