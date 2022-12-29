class InvoiceMailer < ApplicationMailer
    def send_invoice(invoice)
        @invoice = invoice
        @user = invoice.user
        mail(to: @invoice.client.email, subject: "Facture reçu de #{@user.first_name}")
    end
end
