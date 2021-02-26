class Remind < ApplicationRecord
    belongs_to :user , class_name: 'User', foreign_key: 'user_id'
    validates :remind_date ,presence: true
    validates :remid_type , presence: true
    validate :check_date

    private
    def check_date
        unless remind_date.is_a?(NilClass)
            if remind_date < Date.today
                errors.add(:remind_date,"must be for your upcoming checkups")
            end
        end
    end
end