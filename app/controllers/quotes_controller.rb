class QuotesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_quote, only: %i[show edit update destroy show_another]
  
    def index
      @quotes = policy_scope(Quote)
    end
  
    def show
      authorize @quote
    end
  
    def show_another
    end
  
    def new
      @quote = Quote.new
      @clients = Client.where(user_id: current_user.id)
    end
  
    def edit
      @clients = Client.where(user_id: current_user.id)
    end
  
    def create
      @quote = Quote.new(quote_params)
      @quote.user = current_user
      if @quote.save!
        redirect_to quote_url(@quote), notice: "Quote création réussie."
      else
        flash.now[:alert] = "La création du devis a échoué."
        puts @quote.errors.full_messages # Afficher les messages d'erreur dans la console
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      authorize @quote
  
      if @quote.update(quote_params)
        redirect_to quote_url(@quote), notice: "Quote mise à jour faite."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @quote
      @quote.destroy
  
      redirect_to quotes_url, notice: "Quote suppression réussie."
    end
  
    private
  
    def set_quote
      @quote = Quote.find(params[:id])
    end
  
    def quote_params
      params.require(:quote).permit(:amount, :my_company_siret, :date, :description, :quote_number, :prestation, :quote_tva, :client_id)
    end
  end
  