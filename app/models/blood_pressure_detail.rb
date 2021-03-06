class BloodPressureDetail < ApplicationRecord
    belongs_to :user , class_name: 'User', foreign_key: 'user_id'
    validates :s_blood_pressure , presence: true, numericality: true
    validates :d_blood_pressure ,numericality: true, presence: true
    validates :blood_pressure_date ,presence: true
    validate :check_date

    private
    def check_date
        unless blood_pressure_date.is_a?(NilClass)
            if blood_pressure_date > Date.today
                errors.add(:blood_pressure_date,"must be your last checkup date")
            end
        end
    end
end