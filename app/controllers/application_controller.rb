class ApplicationController < ActionController::API
    #before_action :authenticate
    protect_from_forgery with: :null_session

    protected
    def authenticate
        token_str = params[:token]
        token = Token.find_by(token: token_str)

        if token.nil? || !token.is_valid?
            render json: { error: "Your token is not valid", status: :unauthorized}
        else
            @current_user = token.user
        end
    end

    def authenticate_owner(owner)
        if owner != @current_user 
            render json: {
                errors: "You're not authorized to eliminate this poll.",
                status: :unauthorized
            }
        end
    end
end
