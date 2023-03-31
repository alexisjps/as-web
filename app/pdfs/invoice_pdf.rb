require 'prawn'
require 'prawn/table'

class InvoicePdf < Prawn::Document

    def initialize(invoice, current_user)
        super(page_size: 'A4', margin: [50, 50, 50, 50])
        @invoice = invoice
        @user = current_user
        font "Helvetica"
        header
        move_down 20 # Ajout d'espace
        invoice_details
        move_down 20 # Ajout d'espace
        payment_information
        move_down 20 # Ajout d'espace
        invoice_items
        move_down 20 # Ajout d'espace
        invoice_total
        move_down 20 # Ajout d'espace
        payment_terms
    end

  def header
    # Logo de l'utilisateur
    if @user.photo.attached?
      image StringIO.open(@user.photo.download), width: 80, height: 80, position: :left
    end
    move_down 10

    # Informations sur la facture
    text "Facture n°: #{@invoice.invoice_number}", size: 14, style: :bold
    text "Créée: #{@invoice.date}", size: 14
    stroke_horizontal_rule
    move_down 10
  end

  def invoice_details
    data = [
      ["Expéditeur", "Destinataire"],
      ["#{@user.first_name} #{@user.last_name}", "#{@invoice.client.first_name} #{@invoice.client.denomination}"],
      ["#{@user.address}", "#{@invoice.client.compagny_address}"],
      ["#{@user.phone}", ""],
      ["#{@user.email}", "#{@invoice.client.email}"],
      ["N° Siret : #{@user.siret}", "#{@invoice.client.compagny_siret if @invoice.client.compagny_siret != nil}"],
      ["#{@user.tva if @user.tva != nil}", ""]
    ]
  
    table(data, header: true, column_widths: [bounds.width / 2] * 2, cell_style: { size: 10, inline_format: true }) do
      row(0).font_style = :bold
      row(0).background_color = "57C7D8" # Couleur d'arrière-plan pour l'en-tête
      self.row_colors = ["FFFFFF", "EDEDED"]
      self.header = true
      cells.borders = []
      row(0).borders = [:bottom]
      row(0).border_width = 1
      row(0).border_color = "808080"
      column(0).borders = [:right]
      column(0).border_width = 1
      column(0).border_color = "808080"
    end
    move_down 10
  end  

  def payment_information
    text "Informations de paiements :", size: 12, style: :bold
    move_down 5
    text "#{@user.infos_payment}", size: 10
    move_down 10
  end

  def invoice_items
    data = [
      ["Description", "Prix HT"],
      ["#{@invoice.prestation}", "#{@invoice.amount}€ HT"]
    ]

    table(data, header: true, column_widths: [bounds.width / 2] * 2, cell_style: { size: 10, inline_format: true })
    move_down 10
  end

  def invoice_total
    total_tva = (@invoice.amount * @invoice.invoice_tva.to_f) / 100
    with_tva = (total_tva + @invoice.amount)
    first_step = (with_tva.to_i * @invoice.discount) / 100
    second_step = with_tva - first_step

    data = [
      ["Promotion :", "#{@invoice.discount}%"],
      ["Total TVA :", "#{total_tva}€"],
      ["Total :", "#{second_step}€ TTC"]
    ]

    table(data, column_widths: [bounds.width / 2] * 2, cell_style: { size: 10, inline_format: true }) do
      cells.borders = []
    end
    move_down 10
  end

  def payment_terms
    text "Conditions de paiement :", size: 12, style: :bold
    move_down 5
    text "#{@user.conditions}", size: 10
  end
end
