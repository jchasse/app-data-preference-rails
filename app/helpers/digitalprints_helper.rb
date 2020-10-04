module DigitalprintsHelper

    def form_url_helper(account)
        account ? account_digitalprints_path(account) : digitalprints_path
    end

    def digitalprint_options
        ["Email", "Credit Card", "Phone Number","SSN", "Social Media User", "Biometric", "Birthdate", "Employment Details"]
    end

end
