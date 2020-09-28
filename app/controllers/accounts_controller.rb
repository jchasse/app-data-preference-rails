class AccountsController < ApplicationController

    def index

    end

    def new

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