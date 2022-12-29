Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/exit', as: 'rails_admin'
  resources :coordinates
  devise_for :users
  resources :clients
  resources :invoices
  resources :tickets

  get "invoices/:id/send", to: "invoices#send_mail", as: "send_mail"
  get 'print/:id', to: 'invoices#show_another', as: 'print'

  root "lorums#home"
  get "/lorum", to: "lorums#index"
  get "/lorum-resultat", to: "lorums#lorum_result"
  get "emojis", to: "emojis#index"
  get 'mot-de-passe', to: 'pages#password'
end
