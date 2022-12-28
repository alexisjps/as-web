class InvoiceMailer < ApplicationMailer
    def send_invoice(invoice)
        @invoice = invoice
        mail(to: @invoice.client.email, subject: 'Facture')
    end
end
