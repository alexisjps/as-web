class InvoiceMailer < ApplicationMailer
    def send_invoice(invoice, pdf_content)
      @invoice = invoice
      attachments["facture-#{invoice.invoice_number}.pdf"] = { mime_type: 'application/pdf', content: pdf_content }
      mail(to: @invoice.client.email, subject: "Facture reçu de #{@invoice.user.first_name}")
    end
  end
  