class InvoiceMailer < ApplicationMailer
    def send_invoice(invoice)
        @invoice = invoice
        @user = invoice.user
        mail(to: invoice.client.email, subject: 'Invoice')
    end
end
