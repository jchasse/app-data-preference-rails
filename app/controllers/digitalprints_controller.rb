class DigitalprintsController < ApplicationController
    before_action :confirm_logged_in

    def index
        @digitalprints = User.find_by(id: session[:user_id]).digitalprints
    end

    def new
        if params[:account_id]
            @account = Account.find_by(id: params[:account_id])
            @digitalprint = @account.digitalprints.build
        else
            @digitalprint = Digitalprint.new
            @digitalprint.build_account
        end
    end

    def create
        d = Digitalprint.new(digitalprint_params)
        d.user = current_user
        d.account_id = params[:account_id]
        d.save
        redirect_to account_path(d.account)
    end

    private

    def digitalprint_params
        params.require(:digitalprint).permit(:kind, account_attributes: [:id, :org_name, :website, :toll_free_number])
    end
end
