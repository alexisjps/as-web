Rails.application.routes.draw do
  root "pages#home"
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
end
