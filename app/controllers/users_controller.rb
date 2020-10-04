class UsersController < ApplicationController
    before_action :redirect_if_logged_in, only: [:new]
    before_action :set_user, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to accounts_path
        else
            @messages = @user.errors.full_messages
            render 'new'
        end
    end

    def show

    end

    def edit

    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def destroy
        @user.delete
        redirect_to root_path
    end

    private

    def set_user
        @user = User.find_by(id: params[:id])
    end

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
