class BloodSugarDetail < ApplicationRecord
    belongs_to :user , class_name: 'User', foreign_key: 'user_id'

    validates :blood_sugar , presence: true
    validates :blood_sugar_date ,presence: true
    validate :check_date
    private

    def check_date
        if blood_sugar_date > Date.today
            errors.add(:blood_sugar_date,"must be your last checkup date")
        end
    end
end
