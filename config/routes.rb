Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "lorums#home"
  get "/lorum", to: "lorums#index"
  get "/lorum-resultat", to: "lorums#lorum_result"
end
