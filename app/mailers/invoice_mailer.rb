class InvoiceMailer < ApplicationMailer
    def new_invoice_email
        @invoice = params[:invoice]
    
        mail(to: 'invoice@astephan.digital', subject: "You got a new invoice!")
      end
end
