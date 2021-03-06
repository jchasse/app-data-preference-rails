class AccountsController < ApplicationController
    before_action :confirm_logged_in
    before_action :set_account, except: [:new, :create, :index]

    def index
        @accounts = User.find_by(id: session[:user_id]).accounts.distinct
        if params[:search]
            @accounts = @accounts.org_name_search(params[:search])
        end
    end

    def new
        @account = Account.new
        @account.digitalprints.build(user_id: session[:user_id])
    end

    def create
        byebug
        @account = Account.find_or_create_account(account_params)
        if @account.save
            redirect_to account_path(@account)
        else
            @messages = @account.errors.full_messages
            render 'new'
        end
    end

    def show

    end

    def edit

    end

    def update
        if @account.update(account_params)
            redirect_to account_path(@account)
        else
            @messages = @account.errors.full_messages
            render 'edit'
        end
    end

    def destroy
        @account.delete
        redirect_to accounts_path
    end

    private

    def set_account
        @account = Account.find_by(id: params[:id])
    end

    def account_params
        params.require(:account).permit(
            :org_name, 
            :website, 
            :toll_free_number,
            digitalprints_attributes: [:kind, :id, :user_id] 
        )
    end
end