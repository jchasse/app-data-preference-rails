class User < ApplicationRecord
    has_many :digitalprints	
    has_many :accounts, through: :digitalprints
    validates_presence_of :email
    validates_uniqueness_of :email
    has_secure_password


    def full_name
        first_name + " " + last_name unless first_name.nil? || last_name.nil?
    end


end
