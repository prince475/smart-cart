class AuthsController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(email: login_params[:email])

        if @user && @user.authenticate(login_params[:password])
            token = encode_token({ user_id: @user.id, exp: 2.hours.from_now.to_i })
            render json: { user: @user, jwt: token }, status: :accepted
        else
            render json: { error: 'Invalid username or password' }, status: unathorized
        end

    end

    private

    def login_params
        params.permit(:email, :password)
    end

end
