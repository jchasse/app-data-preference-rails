class SessionController < ApplicationController
    before_action :redirect_if_logged_in, except: [:destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

end
