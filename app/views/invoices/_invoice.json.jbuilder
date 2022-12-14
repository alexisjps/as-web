json.extract! invoice, :id, :amount, :my_company_name, :my_compagny_address, :my_company_phone, :my_company_email, :my_company_siret, :my_company_tva, :my_company_paiement, :customer_name, :customer_address, :customer_email, :customer_siret, :date, :description, :invoice_number, :prestation, :invoice_tva, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
