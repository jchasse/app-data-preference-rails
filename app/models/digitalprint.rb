class Digitalprint < ApplicationRecord
    belongs_to :user
    belongs_to :account

    validates_uniqueness_of :kind

    accepts_nested_attributes_for :account

    # def account_name=(org_name)
    #     self.account = Account.find_or_create_by(org_name: org_name)
    # end

    # def account_name
    #     self.account ? self.account.org_name : nil
    # end

end
