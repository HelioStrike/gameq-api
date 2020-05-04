class UserController < ApplicationController

    def signup
        UserService.new(user_params[:email], user_params[:desc]).register
    end

    private
    def user_params
        params.require(:user).permit(:email, :desc)
    end
end
