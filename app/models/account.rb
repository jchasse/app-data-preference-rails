class Account < ApplicationRecord
    has_many :digitalprints	
    has_many :users, through: :digitalprints

    validates_presence_of :org_name, :website, :toll_free_number
    validates_uniqueness_of :org_name

    accepts_nested_attributes_for :digitalprints

    def self.find_or_create_account(params)
        account = Account.find_by(org_name: params[:org_name])
        if !!account
            account.digitalprints_attributes= params[:digitalprints_attributes]
            account.save
            account
        else
            Account.create(params)
        end
    end

    def self.email_accounts
        includes(:digitalprints).where(digitalprints: { kind: 'Email' })
    end

    def self.email_count
        email_accounts.count
    end


end
