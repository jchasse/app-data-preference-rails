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

    def account_params
        params.require(:account).permit(
            :org_name, 
            :website, 
            :toll_free_number, 
        )
    end
end