Rails.application.routes.draw do
  devise_for :users
  resources :invoices
  resources :tickets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # sitemap
  # Defines the root path route ("/")
  root "lorums#home"
  get "/lorum", to: "lorums#index"
  get "/lorum-resultat", to: "lorums#lorum_result"
  get "emojis", to: "emojis#index"
  get 'mot-de-passe', to: 'pages#password'
  get '/actualites-technologies', to: 'pages#actu'
end
