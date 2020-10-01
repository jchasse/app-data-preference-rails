class User < ApplicationRecord
    has_many :digitalprints	
    has_many :accounts, through: :digitalprints
    has_secure_password


    def full_name
        first_name + " " + last_name
    end


end
