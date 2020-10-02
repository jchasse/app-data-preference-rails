class Digitalprint < ApplicationRecord
    belongs_to :user
    belongs_to :account

    accepts_nested_attributes_for :account

    scope :kind_search, -> (search) { where("kind >= ?", search) }
    
end
