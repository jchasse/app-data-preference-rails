class Account < ApplicationRecord
    has_many :digitalprints	
    has_many :users, through: :digitalprints
    accepts_nested_attributes_for :digitalprints

end
