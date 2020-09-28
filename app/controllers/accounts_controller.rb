class AccountsController < ApplicationController

    def index
        if params[:user_id]
            @accounts = User.find_by(id: params[:user_id]).accounts
          else
            @accounts = Account.all
        end
    end

    def new
        @account = Account.new
    end

    def create
        if @account = Account.create(account_params)
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
        )
    end
end