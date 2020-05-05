class UserController < ApplicationController

    def signup
        user = UserService.new(user_params[:email], user_params[:desc]).register
        if user.errors
            render :nothing => true, :status => :bad_request
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :desc)
    end
end
