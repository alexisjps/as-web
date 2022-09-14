class LorumsController < ApplicationController
    def index
    end
    def result
        @lorums = Lorum.all
        @num = params[:lorum].to_i
        @lorum = Lorum.find(@num)
    end
end
