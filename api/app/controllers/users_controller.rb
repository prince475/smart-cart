class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def index
        user = User.all
        if current_user
            render json: user, status: :ok
        else
            render json: { error: "Not authorized" }, status: :unathorized
        end
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    
    def user_params
        params.permit(:name, :email, :phone_number, :password)
    end
end
