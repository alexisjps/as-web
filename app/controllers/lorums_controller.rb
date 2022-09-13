class LorumsController < ApplicationController
    def index
        @lorums = Lorum.all
    end
    def show
        @lorum = Lorum.find(params[:id])
    end
end
