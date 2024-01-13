Rails.application.routes.draw do
  root "pages#home"
  
  mount RailsAdmin::Engine => '/exit', as: 'rails_admin'
  
  devise_for :users
  # get 'dashboards/show'
  
  resources :coordinates
  resources :clients
  resources :quotes
  resources :tickets

  resources :invoices do
    collection do
      get 'cloudinary_invoices'
    end

    member do
      post 'save_to_cloudinary'
      get 'download_pdf'
      # delete 'destroy'
    end
  end
  
  get "invoices/:id/send", to: "invoices#send_mail", as: "send_mail"
  get 'print_quote/:id', to: 'quotes#show_another', as: 'print_quote'
end
