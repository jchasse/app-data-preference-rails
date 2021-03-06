class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user

    def current_user
        User.find_by(id: session[:user_id])
    end

    def confirm_logged_in
        redirect_to root_path if !current_user
    end

    def redirect_if_logged_in
        redirect_to accounts_path if current_user
    end

end
