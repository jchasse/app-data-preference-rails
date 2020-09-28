class User < ApplicationRecord
    has_many :digitalprints	
    has_many :accounts, through: :digitalprints

end
