Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/exit', as: 'rails_admin'
  resources :coordinates
  devise_for :users
  resources :clients
  resources :invoices do
    get 'cloudinary_invoices', on: :collection
    post 'save_to_cloudinary', on: :member
    member do
      get 'download_pdf'
    end
  end
  resources :quotes
  resources :tickets

  # Check dns
  get 'dns', to: 'dnslookups#lookup', as: 'dnslookupslookup'
  # Fin check dns
  # Manage invoice / quote
  get "invoices/:id/send", to: "invoices#send_mail", as: "send_mail"
  get 'print_quote/:id', to: 'quotes#show_another', as: 'print_quote'

  # Antohers routes (a delete)
  root "lorums#home"
  get "/lorum", to: "lorums#index"
  get "/lorum-resultat", to: "lorums#lorum_result"
  get "emojis", to: "emojis#index"
  get 'mot-de-passe', to: 'pages#password'
end
