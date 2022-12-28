require 'tempfile'

class InvoiceMailer < ApplicationMailer
  default from: "no-reply@astephan.digital"
  # default from: %(AS WEB <contact@hellomybusiness.fr>)
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invoice_mailer.send_to_client.subject
  #
  def send_to_client(invoice)
    @invoice = invoice
    attachments["#{invoice.reference}.pdf"] = File.read(generate_invoice_pdf_file(invoice))

    email_with_name = %("#{@invoice.client.first_name}" <#{@invoice.client.email}>)
    email_sender = %("#{@invoice.user.first_name} #{@invoice.user.last_name}")
    mail(to: email_with_name, subject: "#{email_sender} - #{invoice.title} #{invoice.reference}")
  end

  private

  def generate_invoice_pdf_file(invoice)
    # raise
    pdf_html = ApplicationController.render(
      locals: {
        current_user: invoice.user,
      },
      assigns: {
        invoice: invoice,
        format: 'pdf'
      },
      template: 'invoices/show',
      layout: 'pdf'
    )
    
    html_absolute = Grover::HTMLPreprocessor.process pdf_html, base_url, Rails.application.config.action_mailer.default_url_options[:protocol]

    pdf = Grover.new(html_absolute, {
      format: 'A4',
      display_url: base_url
    }).to_pdf

    tempfile = Tempfile.new("facture-#{invoice.id}.pdf")

    File.open(tempfile.path, 'wb') do |file|
      file << pdf
    end

    tempfile.close

    return tempfile.path
  end
end
