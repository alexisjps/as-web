class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: %i[ show edit update destroy show_another]
  before_action :set_invoice_pdf, only: [:store_on_cloudinary]


  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
  end

  def store_on_cloudinary
    @invoice = Invoice.find(params[:id])
  
    # Générez le fichier PDF de l'invoice
    template_path = Rails.root.join('app', 'views', 'invoices', 'show.pdf.erb')
    pdf = WickedPdf.new.pdf_from_string(render_to_string(file: template_path, layout: false))
  
    # Créez un fichier temporaire pour stocker le PDF généré
    temp_pdf = Tempfile.new(["invoice_#{invoice.id}", '.pdf'], encoding: 'ascii-8bit')
    temp_pdf.write(pdf)
    temp_pdf.rewind
  
    # Stockez le fichier PDF sur Cloudinary
    result = Cloudinary::Uploader.upload(temp_pdf.path, resource_type: "raw")
  
    # Fermez et supprimez le fichier temporaire
    temp_pdf.close
    temp_pdf.unlink
  
    # Sauvegardez l'URL du fichier PDF stocké sur Cloudinary dans votre modèle Invoice
    @invoice.update(cloudinary_url: result['secure_url'])
  
    redirect_to invoices_path, notice: 'Invoice stockée sur Cloudinary avec succès.'
  end
  
  # GET /invoices/1 or /invoices/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Invoice-#{@invoice.id}",
               template: 'invoices/pdf/show.pdf.erb',
               layout: false,
               locals: { invoice: @invoice }
      end
    end
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

    def set_invoice_pdf
      template_path = Rails.root.join('app', 'views', 'invoices', 'pdf', 'show.pdf.erb')
      pdf = WickedPdf.new.pdf_from_string(render_to_string(file: template_path, layout: false, locals: { invoice: @invoice }))
    end
end
