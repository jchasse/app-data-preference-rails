class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            render 'new'
        end
    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(
            :first_name, 
            :last_name, 
            :email, 
            :mobile_number, 
            :password, 
            :password_confirmation
        )
    end
end
