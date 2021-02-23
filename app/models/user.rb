class User < ApplicationRecord
    has_secure_password
    has_many :blood_sugar_details ,class_name: 'BloodSugarDetail'
    validates :username, presence: true, uniqueness: true
    validates :password , presence: true
    validates :password_confirmation , presence: true
    validates :name, presence: true
    validates :last_name , presence: true
    validates :dob , presence: true
    validates :gender , presence: true
    validates :weight , presence: true
    validates :height , presence: true

    before_save :calculate_bmi


    private

    def calculate_bmi
        self.bmi = self.weight / ((self.height*0.3048)**2)
        self.bmi = self.bmi.round(2)
    end

end
