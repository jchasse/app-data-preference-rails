class User < ApplicationRecord
    has_many :digitalprints	
    has_many :accounts, through: :digitalprints
    validates_presence_of :first_name, :last_name, :mobile_phone, :email
    validates_uniqueness_of :email
    has_secure_password


    def full_name
        first_name + " " + last_name
    end


end
