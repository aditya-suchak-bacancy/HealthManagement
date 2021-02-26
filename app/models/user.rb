class User < ApplicationRecord
    has_secure_password
    has_many :blood_sugar_details ,class_name: 'BloodSugarDetail'
    has_many :blood_pressure_details ,class_name: 'BloodPressureDetail'
    validates :username, presence: true, uniqueness: true
    validates :password , presence: true
    validates :password_confirmation , presence: true
    validates :name, presence: true
    validates :last_name , presence: true
    validates :dob , presence: true
    validates :gender , presence: true
    validates :weight , presence: true
    validates :height , presence: true
    validate :check_date
    before_save :calculate_bmi
    after_validation :update_name


    private

    def calculate_bmi
        self.bmi = self.weight / ((self.height*0.3048)**2)
        self.bmi = self.bmi.round(2)
    end

    def check_date
        if dob > Date.today
            errors.add(:dob,"is invalid")
        end
    end

    def update_name
        self.name = name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end

end
