Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/exit', as: 'rails_admin'
  resources :coordinates
  devise_for :users
  resources :clients
  resources :invoices
  get 'print/:id', to: 'invoices#show_another', as: 'print'
  resources :invoices do
    member do
      post :send_to_client
      post :send_to_client_form_show
    end
  end
  resources :tickets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # sitemap
  # Defines the root path route ("/")
  root "lorums#home"
  get "/lorum", to: "lorums#index"
  get "/lorum-resultat", to: "lorums#lorum_result"
  get "emojis", to: "emojis#index"
  get 'mot-de-passe', to: 'pages#password'
end
