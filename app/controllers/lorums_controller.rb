class LorumsController < ApplicationController
    def index
    end
    def lorum_result
        @lorums = Lorum.all
        @num = params[:lorum].to_i
        @lorum = Lorum.find(@num)
    end
end
