class Account < ApplicationRecord
    has_many :digitalprints	
    has_many :users, through: :digitalprints


    # def account_org_name=(org_name)
    #     self.account = Category.find_or_create_by(org_name: org_name)
    # end
    
    # def account_org_name
    #      self.account ? self.account.org_name : nil
    # end
end
