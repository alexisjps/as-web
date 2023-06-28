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
    delete 'destroy', on: :member # Ajout de la route pour la suppression
  end
  resources :quotes
  resources :tickets
  
  get "invoices/:id/send", to: "invoices#send_mail", as: "send_mail"
  get 'print_quote/:id', to: 'quotes#show_another', as: 'print_quote'
end
