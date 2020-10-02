class Account < ApplicationRecord
    has_many :digitalprints	
    has_many :users, through: :digitalprints
    
    accepts_nested_attributes_for :digitalprints

    validates_presence_of :org_name
    validates_uniqueness_of :org_name

    def digitalprints_attributes=(digitalprint_attributes)
        digitalprint_attributes.values.each do |digitalprint_attribute|
          if digitalprint_attribute["kind"].present?
            digitalprint = Digitalprint.create(digitalprint_attribute)
            self.digitalprints << digitalprint
          end
        end
      end

end
