class InvoicePdf < Prawn::Document
    def initialize(invoice)
        super()
        @invoice = invoice
        @client = Client.find(@invoice.client_id)
        @user = User.find(@invoice.user_id)
        text @invoice.prestation
        text @invoice.description
        text @invoice.amount.to_s
        text @invoice.date.to_s
        text @invoice.invoice_number.to_s
        text @invoice.invoice_tva
        text @client.first_name
        text @client.last_name
        text @client.email
        text @client.compagny_siret
        text @client.phone
    end
end