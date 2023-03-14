class QuotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_quote, only: %i[ show edit update destroy show_another]
    
    # GET /quotes or /quotes.json
    def index
        @quotes = Quote.all
    end
    
    # GET /quotes/1 or /quotes/1.json
    def show
    end
    # GET /print/1 
    def show_another
    end
    
    # GET /quotes/new
    def new
        @quote = Quote.new
        @clients = Client.where(user_id: current_user.id)
    end
    
    # GET /quotes/1/edit
    def edit
        @clients = Client.where(user_id: current_user.id)
    end
    
    # GET /quotes/1/send
    # def send_mail
    #     @quote = Quote.find(params[:id])
    #     @user = current_user
    #     # quoteMailer.send_quote(@quote).deliver_now
    #     quote.update(@quote.id, status: true)
    #     redirect_to quotes_path
    #     flash.alert = "Facture envoyée à #{@quote.client.first_name}"
    # end
    
    # POST /quotes or /quotes.json
    def create
        @clients = Client.all
        @user = current_user
        # raise
        @quote = Quote.new(quote_params)
        @quote.user = @user
        respond_to do |format|
        if @quote.save
            format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
            format.json { render :show, status: :created, location: @quote }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
        end
    end
    
    # PATCH/PUT /quotes/1 or /quotes/1.json
    def update
        respond_to do |format|
        if @quote.update(quote_params)
            format.html { redirect_to quote_url(@quote), notice: "quote was successfully updated." }
            format.json { render :show, status: :ok, location: @quote }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
        end
    end
    
    # DELETE /quotes/1 or /quotes/1.json
    def destroy
        @quote.destroy
    
        respond_to do |format|
        format.html { redirect_to quotes_url, notice: "quote was successfully destroyed." }
        format.json { head :no_content }
        end
    end
    
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_quote
        @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
        params.require(:quote).permit(:amount, :my_company_siret, :date, :description, :quote_number, :prestation, :quote_tva, :client_id)
    end
end
