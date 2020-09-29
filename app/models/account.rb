class Account < ApplicationRecord
    has_many :digitalprints	
    has_many :users, through: :digitalprints
end
