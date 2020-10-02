class AccountsController < ApplicationController
    before_action :confirm_logged_in

    def index
        if session[:user_id]
            @accounts = User.find_by(id: session[:user_id]).accounts
        end
    end

    def new
        @account = Account.new
        @digitalprints = ["Email", "Credit Card", "Phone Number","SSN", "Social Media Username"]
        @account.digitalprints.build(user_id: session[:user_id])
    end

    def create
        @account = Account.find_or_create_account(account_params)
        if @account.save
            redirect_to account_path(@account)
          else
            render 'new'
        end
    end

    def show
        @account = Account.find_by(id: params[:id])
    end

    def edit
        @account = Account.find_by(id: params[:id])
    end

    def update
        @account = Account.find_by(id: params[:id])
        if @acccount.update(account_params)
            redirect_to account_path(@account)
        else
            render 'edit'
        end
    end

    def destroy
        @account = Account.find_by(id: params[:id])
        @account.delete
        redirect_to accounts_path
    end

    private

    def account_params
        params.require(:account).permit(
            :org_name, 
            :website, 
            :toll_free_number,
            digitalprints_attributes: [:kind, :user_id] 
        )
    end
end