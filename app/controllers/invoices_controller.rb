class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: %i[ show edit update destroy show_another save_to_cloudinary]
  
  # My method for pdf
  def download_pdf
    @invoice = Invoice.find(params[:id])
    pdf = InvoicePdf.new(@invoice, current_user)
    send_data pdf.render, filename: "facture-#{@invoice.invoice_number}.pdf", type: 'application/pdf', disposition: 'inline'
  end

  # Save invoice
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

  # See all invoices on cloudinary
  def cloudinary_invoices
    @invoices = current_user.invoices.joins(:cloudinary_file_attachment).distinct
  end   
  
  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1 or /invoices/1.json
  def show
  end
  # GET /print/1 
  def show_another
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @user = current_user
    @clients = Client.where(user_id: @user.id)
  end

  # GET /invoices/1/edit
  def edit
    @user = current_user
    @clients = Client.where(user_id: @user.id)
  end

  # GET /invoices/1/send
  def send_mail
    @invoice = Invoice.find(params[:id])
    @user = current_user
    InvoiceMailer.send_invoice(@invoice).deliver_now
    Invoice.update(@invoice.id, status: true)
    redirect_to invoices_path
    flash.alert = "Facture envoyée à #{@invoice.client.first_name}"
  end

  # POST /invoices or /invoices.json
  def create
    @clients = Client.all
    @user = current_user
    @invoice = Invoice.new(invoice_params)
    @invoice.user = @user
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice création réussie." }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoice_url(@invoice), notice: "Invoice mise à jour faite" }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: "Invoice suppression réussie" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def invoice_params
      params.require(:invoice).permit(:amount, :my_company_siret, :date, :description, :invoice_number, :prestation, :invoice_tva, :client_id, :discount)
    end
end
