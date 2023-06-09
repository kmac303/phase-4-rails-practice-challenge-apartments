class Tenant < ApplicationRecord
    has_many :leases
    has_many :apartments, through: :leases

    validates :name, presence: :true
    validate :at_least_18

    def at_least_18
        unless self.age >= 18
            errors.add(:age, "You must be 18 years or older.")
        end
    end

end
