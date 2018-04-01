class Api::V1::QuestionsController < ApplicationController
    before_action :authenticate, except: [:index, :show]
    before_action :set_question, only:[:update, :show, :delete]

    def index
    end

    def show 
    end 

    def create 
    end 
     
    def update 
    end 

    def delete 
    end

    private
    def question_params
        params.require(:question).permit(:description)
    end

    def set_question
        @question = Question.find(params[:id])
    end 
end
