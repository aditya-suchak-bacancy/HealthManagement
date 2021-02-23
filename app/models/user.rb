class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password , presence: true
    validates :password_confirmation , presence: true
    validates :name, presence: true
    validates :last_name , presence: true
    validates :dob , presence: true
    validates :gender , presence: true
    validates :weight , presence: true
    validates :height , presence: true
    # validates :blood_sugar , presence: true
    # validates :blood_pressure , presence: true
    # validates :blood_presssure_date ,presence: true
    # validates :blood_sugar_date , presence: true

    before_save :calculate_bmi


    private

    def calculate_bmi
        self.bmi = self.weight / ((self.height*0.3048)**2)
        self.bmi = self.bmi.round(2)
    end

end
