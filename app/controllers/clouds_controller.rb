class CloudsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:index, :new, :create, :show, :destroy]
    def index
        @cloud = Cloud.where(user: current_user)
    end
    def new
        @cloud = Cloud.new
    end
    def create
        @cloud = Cloud.new(cloud_params)
        @cloud.user = @user
        if @cloud.save
            redirect_to cloud_path(@cloud)
        else
            render :new
        end
    end
    def destroy
        @cloud.destroy
        redirect_to user_path(@user)
    end

    private
    def cloud_params
        params.require(:cloud).permit(photos: [])
    end
    def set_user
        @user = current_user
    end
end
