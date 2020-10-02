class Account < ApplicationRecord
    has_many :digitalprints	
    has_many :users, through: :digitalprints

    validates_presence_of :org_name
    validates_uniqueness_of :org_name

    accepts_nested_attributes_for :digitalprints

    def self.find_or_create_account(params)
        if account = Account.find_by(org_name: params[:org_name])
            account.digitalprints_attributes= params[:digitalprints_attributes]
            account
        else
            account = Account.create(params)
        end
    end


end
