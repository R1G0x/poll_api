class Api::V1::MyPollsController < ApplicationController
    before_action :authenticate, only:[:create, :update, :destroy]
    before_action :set_poll, only:[:show,:update,:destroy]
    def index
        @polls = MyPoll.all
    end 

    def show 
    end 

    def create
        @poll = @current_user.my_polls.new(my_polls_params)
        if @poll.save
            render :show  
        else
            render json: {
                errors: @poll.errors.full_messages,
                status: :unprocessable_entity
            }
        end  
    end

    def update 
        if @poll.user == @current_user
            @poll.update(my_polls_params)
            render :show
        else 
            render json:{
                errors: "You don't have permissions to update this poll",
                status: :unauthorized
            }
        end
    end

    def destroy
        if @poll.user == @current_user
            @poll.destroy
            render json: {
                message: "Poll deleted"
            }
        else 
            render json:{
                errors: "You don't have permissions to delete this poll",
                status: :unauthorized
            }
        end
    end 

    private 
    def my_polls_params
        params.require(:poll).permit(:title, :description, :expires_at)
    end

    def set_poll
        @poll = MyPoll.find(params[:id])
    end
end