class LorumsController < ApplicationController
    def index
        
    end
    def result
        @lorum_paragraphe = params[:lorum]
    end
end
