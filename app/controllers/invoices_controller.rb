class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: %i[show edit update destroy show_another save_to_cloudinary]
  
  def download_pdf
    @invoice = Invoice.find(params[:id])
    pdf = InvoicePdf.new(@invoice, current_user)
    send_data pdf.render, filename: "facture-#{@invoice.invoice_number}.pdf", type: 'application/pdf', disposition: 'inline'
  end

  def save_to_cloudinary
    pdf = InvoicePdf.new(@invoice, current_user)
    pdf_data = pdf.render

    tempfile = Tempfile.new([@invoice.id.to_s, ".pdf"], binmode: true)
    tempfile.write(pdf_data)
    tempfile.rewind

    @invoice.cloudinary_file.attach(io: tempfile, filename: "invoice-#{@invoice.id}.pdf", content_type: 'application/pdf')
    tempfile.close
    tempfile.unlink

    flash[:notice] = "La facture a été sauvegardée sur Cloudinary avec succès."
    redirect_to cloudinary_invoices_invoices_path
  end

  def cloudinary_invoices
    @invoices = current_user.invoices.joins(:cloudinary_file_attachment).distinct
  end   
  
  def index
    @invoices = policy_scope(Invoice)
  end

  def show
    authorize @invoice
  end

  def show_another
  end

  def new
    @invoice = Invoice.new
    @user = current_user
    @clients = Client.where(user_id: @user.id)
  end

  def edit
    @user = current_user
    @clients = Client.where(user_id: @user.id)
  end

  def send_mail
    @invoice = Invoice.find(params[:id])
    @user = current_user
    InvoiceMailer.send_invoice(@invoice).deliver_now
    Invoice.update(@invoice.id, status: true)
    redirect_to invoices_path
    flash.alert = "Facture envoyée à #{invoice.client.first_name}"
  end

  def create
    @clients = Client.all
    @user = current_user
    @invoice = Invoice.new(invoice_params)
    authorize @invoice
    @invoice.user = @user
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_path(@invoice), notice: "Invoice création réussie." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @invoice
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoices_path(@invoice), notice: "Invoice mise à jour faite" }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @invoice
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_path, notice: "Invoice suppression réussie" }
      format.json { head :no_content }
    end
  end

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:amount, :my_company_siret, :date, :description, :invoice_number, :prestation, :invoice_tva, :client_id, :discount)
    end
end
