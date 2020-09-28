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

    end

    def update

    end

    def destroy

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