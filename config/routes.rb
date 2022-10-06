Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # sitemap
  resources :sitemaps, only: [:index]
  # Defines the root path route ("/")
  root "lorums#home"
  get "/lorum", to: "lorums#index"
  get "/lorum-resultat", to: "lorums#lorum_result"
  get "emojis", to: "emojis#index"
end
