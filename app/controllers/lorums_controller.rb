class LorumsController < ApplicationController
    def index
    end
    def result
        @lorums = Lorum.all
        @num = params[:lorum].to_i
        # @lorum = Lorum.find(@num)
        # @answer = []
        while @num > @lorums.size
            @answer = @lorums.first(@num)
            @num += 1
        end 
        raise
    end
end
