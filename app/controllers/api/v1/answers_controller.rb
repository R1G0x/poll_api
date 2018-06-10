class Api::V1::AnswersController < ApplicationController
    before_action :authenticate, except: [:index, :show]
    before_action :set_answer, only: [:update, :destroy]
    before_action :set_poll
    before_action(only:[:update,:destroy]) { 
        |controller| controller.authenticate_owner(@poll.user)
    }

    def create
    end 

    def update 
    end

    def destroy 
    end 

    private 
    def set_answer 
    end 

    def answer_params
    end 
end
