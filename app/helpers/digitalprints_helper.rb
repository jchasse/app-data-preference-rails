module DigitalprintsHelper

    def form_url_helper(account)
        account ? account_digitalprints_path(account) : digitalprints_path
    end

end
