class LorumsController < ApplicationController
    def index
    end
    def result
        @lorums = Lorum.all
        @num = params[:lorum].to_i
        @lorum = Lorum.find(@num)
        while @num < @lorums.length
            @asnwer = @lorum.paragraphe
        end 
    end
end
