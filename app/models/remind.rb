class Remind < ApplicationRecord
    belongs_to :user , class_name: 'User', foreign_key: 'user_id'
    validate :check_date


    private

    def check_date
        if remind_date < Date.today
            errors.add(:remind_date,"must be for your upcoming checkups")
        end
    end

end
