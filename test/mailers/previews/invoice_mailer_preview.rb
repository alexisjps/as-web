# Preview all emails at http://localhost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
    def send_invoice_preview
        InvoiceMailer.send_invoice(@invoice)
    end
end
