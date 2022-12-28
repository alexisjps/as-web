# frozen_string_literal: true

require 'tempfile'

class UploadPdfJob < ApplicationJob
  queue_as :default


  def perform(id, type)
    create_pdf_copy(id, type)
  end

  private

  def create_pdf_copy(id, type)
    value = type == 'invoice'? Invoice.find(id) : Quote.find(id)
    template_path = type == 'invoice'? 'invoices/show': 'quotes/show.html.erb'
    file_type = type == 'invoice'? 'facture': 'devis'

    pdf_html = ApplicationController.render(
      locals: {
        current_user: value.user,
      },
      assigns: {
        "#{type}": value,
        format: 'pdf'
      },
      template: template_path,
      layout: 'pdf'
    )

    base_url = "#{Rails.application.config.action_mailer.default_url_options[:protocol]}://#{Rails.application.config.action_mailer.default_url_options[:host]}/"


    html_absolute = Grover::HTMLPreprocessor.process pdf_html, base_url, Rails.application.config.action_mailer.default_url_options[:protocol]

    pdf_file = Grover.new(html_absolute, {
      format: 'A4',
      display_url: base_url
    }).to_pdf

    tempfile = Tempfile.new("#{file_type}-#{value.id}.pdf")

    File.open(tempfile.path, 'wb') do |file|
      file << pdf_file
    end

    tempfile.close

    unless pdf_file.blank?
      value.photo.attach(io: File.open(tempfile.path), filename: "#{value.reference}.pdf")
    end
  end
end
