class SessionController < ApplicationController
    before_action :redirect_if_logged_in, except: [:destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to accounts_path
        else
            @errors = ["Username or password incorrect"]
            render 'new'
        end
    end

    def create_with_fb
        @user = User.find_or_create_by(email: auth['email']) do |u|
            u.password = 'password' #update to random password generator before production
        end
        @user.save
        session[:user_id] = @user.id
    
        redirect_to accounts_path
    end


    def destroy
        session.delete("user_id")
        redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']["info"]
    end

end
