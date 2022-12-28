# Preview all emails at http://localhost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
    def new_invoice_email
        # Set up a temporary invoice for the preview
        invoice = Invoice.new(description: "Vous avez reçu une facture")
    
        InvoiceMailer.with(invoice: invoice).new_invoice_email
      end
end
