class UsersController < ApplicationController
    before_action :redirect_if_logged_in

    def new
        @user = User.new
    end

    def create
        byebug
        if @user = User.create(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
          else
            render 'new'
        end
    end

    def show
        @user = User.find_by(id: params[:id]) #can this be tied to current_user?
    end

    def edit
        @user = User.find_by(id: params[:id]) #can this be tied to current_user?
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.delete
        redirect_to root_path
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
