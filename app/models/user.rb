class User < ApplicationRecord
    has_many :digitalprints	
    has_many :accounts, through: :digitalprints
    has_secure_password

end
