class LorumsController < ApplicationController
    def index
        
    end
    def result
        numbers = params[:lorum].to_i
        @lorums = Lorum.select(id: 1..numbers)
    end
end
