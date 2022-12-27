class ClientsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:new, :create]
    before_action :set_client, only: [:show, :edit, :update, :destroy]
    def index
        @clients = Client.all
    end
    def show
        @client = Client.find(params[:id])
    end
    def new
        @client = Client.new
    end
    def create
        @client = Client.new(client_params)
        @client.user = current_user
        if @client.save
            redirect_to clients_path
        else
            render :new
        end
    end
    def edit
        @client = Client.find(params[:id])
        if @client.user == current_user
            render :edit
        else
            redirect_to clients_path
        end
    end
    def update
        if @client.update(client_params)
            redirect_to clients_path
        else
            render :edit
        end
    end
    def destroy
        @client.destroy
        redirect_to clients_path
    end
    private
    def set_client
        @client = Client.find(params[:id])
    end
    def client_params
        params.require(:client).permit(:first_name, :last_name, :email, :compagny_siret, :compagny_address, :phone, :address)
    end
    def set_user
        @user = current_user.id
    end
end
