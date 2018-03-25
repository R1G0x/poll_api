class ApplicationController < ActionController::API
    #before_action :authenticate
    def authenticate
        token_str = params[:token]
        token = Token.find_by(token: token_str)

        if token.nil? || !token.is_valid?
            render json: { error: "Your token is not valid", status: :unauthorized}
        else
            @current_user = token.user
        end
    end
end
